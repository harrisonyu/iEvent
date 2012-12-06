class EventController < ApplicationController

	def web_crawler
		require 'net/http'
		require 'nokogiri'
		require 'open-uri'

		#Event = Struct.new(:speaker, :date, :time, :location, :sponsor)
		#def get_html( )
    	# Gets the source for all the event pages
		source = Net::HTTP.get(URI('http://illinois.edu/calendar/list/7'))
		# Time for RegEx
		# Look for all strings that match this pattern..
		# http://illinois.edu/calendar/detail/7?eventId=[NUMBERS]
		# within source
		reg = source.scan(/http:\/\/illinois\.edu\/calendar\/detail\/7\?eventId=[0-9]+/)
		reg = reg.uniq
		event_array = []
		for i in 0..20#reg.length()-1
			# For every match in reg we append it to the event array
			event_array << reg[i]
		end
		# Create an event struct
		/Event1 = Struct.new(:name, :speaker, :date, :time, :location, :sponsor, :cost, :event_t, :desc)/
		output = [] 
		sponsor_output = []
		#person_output = []
		# NOTE : There are about 550+ events in event_array, it took upwards of 15min to crawl and parse them all.
		# I have a feeling it should be faster than that though
		for i in 0..20#event_array.length()-1
			# For every event, grab the source of the page
			eventsource = Nokogiri::HTML(open(event_array[i]))
			# array a holds the all the type of applicable attributes on the page(eg. cost, date, etc)
			# array b holds the respective values of each type
			a = eventsource.xpath('//*[contains(concat( " ", @class, " " ), concat( " ", "column-label", " " ))]')
			b = eventsource.xpath('//*[contains(concat( " ", @class, " " ), concat( " ", "column-info", " " ))]')
			# declare vars outside loop for access
			name = eventsource.css('div#event-wrapper h2').text.to_s.gsub!(/(<[^>]*>)|\n|\t/s) {""}
			date = ""
			location = ""
			sponsor = ""
			#speaker = ""
			#time = ""
			eventtype = ""
			cost = ""
			desc = eventsource.css("div.description-row").text.to_s
			# assigns attributes to their respective values
			for i in 0..a.length-1
				a[i].text.to_s == "Date " ? date = b[i].text.to_s : date = date
				a[i].text.to_s == "Location " ? location = b[i].text.to_s : location = location
				a[i].text.to_s == "Sponsor " ? sponsor = b[i].text.to_s : sponsor = sponsor
				#a[i].text.to_s == "Speaker " ? speaker = b[i].text.to_s : speaker = speaker
				#a[i].text.to_s == "Time " ? time = b[i].text.to_s : time = time
				a[i].text.to_s == "Event type " ? eventtype = b[i].text.to_s : eventtype = eventtype
				a[i].text.to_s == "Cost " ? cost = b[i].text.to_s : cost = cost
				# to satisfy validates_precense of, i'm not sure how to make ruby do nothing so i just assigned it back to itself
				eventtype == "" ? eventtype = "UIUC" : eventtype = eventtype
				location == "" ? location = "N/A" : location = location
			end
			new_event = Event.new
			new_event.name = name
			new_event.location = location
			new_event.event_type = eventtype
			new_event.cost = cost
			new_event.event_start_time = date
			new_event.description = desc
			person = Person.new
			person.name = sponsor
			person.save
			#person_output << person
			sponsor = Sponsor.new
			sponsor.sponsorName = person.name
			#new_event = Event.new(name, speaker, date, time, location, sponsor, cost, eventtype, desc)
			output << new_event
			sponsor_output << sponsor
		end
		for i in 0..output.length()-1
			@newevent = Event.new
			@newevent.name = output[i].name
			@newevent.location = output[i].location
			@newevent.event_type = output[i].event_type
			@newevent.cost = output[i].cost
			@newevent.event_start_time = output[i].event_start_time
			@newevent.description = output[i].description
			#@newevent.createdby_user_id = 1234567890
			#@personnew = Person.new
			#@personnew.name = person_output[2].name
			#@personnew.save
			@newsponsor = Sponsor.new
			@newsponsor.sponsorName = sponsor_output[i].sponsorName
			if @newevent.save
				@newsponsor.event_id = @newevent.id
				@newsponsor.save
			end
		end
		redirect_to home_path and return
	end


	def show
		@id = params[:id]
		@event = Event.find_by_id(@id)
		if !@event
			flash[:warning] = "That event does not exist!"
			redirect_to home_path and return
		end
	end

	def new
		@event = Event.new
	end


	def create
		@form = params[:event]
		@event = Event.new
		@event.name = @form[:name]
		@event.event_start_time = Date.new( @form["event_start_time(1i)"].to_i, @form["event_start_time(2i)"].to_i, @form["event_start_time(3i)"].to_i)
		@event.event_end_time = Date.new( @form["event_end_time(1i)"].to_i, @form["event_end_time(2i)"].to_i, @form["event_end_time(3i)"].to_i)
		@event.cost = @form[:cost]
		@event.location = @form[:location]
		@event.description = @form[:description]
		@event.registration_deadline = Date.new( @form["registration_deadline(1i)"].to_i, @form["registration_deadline(2i)"].to_i, @form["registration_deadline(3i)"].to_i)
		@event.food = @form[:food]
		@event.event_type = @form[:event_type]
		@event.createdby_user_id = current_user.id
		if @event.save
			flash[:notice] = "#{@event.name} has been made."
			redirect_to home_path and return
		else
			flash[:warning] = "Invalid event, try again. Make sure to fill out a Name!"
			redirect_to new_event_path and return
		end
	end

	def update_name
		@event = Event.new
	end

	def update_name_save
		@id = params[:id]
		@form = params[:event]
		@event = Event.find_by_id(@id)
		if !@event
			flash[:warning] = "Event does not exist."
		else
			@event.name = @form[:name]
			if@event.save
				flash[:notice] = "Event name has been modified"
				redirect_to show_event_path and return
			else
				flash[:warning] = "Invalid event name, try again"
				redirect_to update_name_event_path and return
			end
		end
	end

	def update_type
		@event = Event.new
	end

	def update_type_save
		@id = params[:id]
		@form = params[:event]
		@event = Event.find_by_id(@id)
		if !@event
			flash[:warning] = "Event does not exist."
		else
			@event.event_type = @form[:event_type]
			if@event.save
				flash[:notice] = "Event type has been modified"
				redirect_to show_event_path and return
			else
				flash[:warning] = "Event type has failed, try again"
				redirect_to update_type_event_path and return
			end
		end
	end


	def update_start_time
		@event = Event.new
	end

	def update_start_time_save
		@id = params[:id]
		@form = params[:event]
		@event = Event.find_by_id(@id)
		if !@event
			flash[:warning] = "Event does not exist."
		else
			@event.event_start_time = Date.new( @form["event_start_time(1i)"].to_i, @form["event_start_time(2i)"].to_i, @form["event_start_time(3i)"].to_i)
			if@event.save
				flash[:notice] = "Event start time has been modified"
				redirect_to show_event_path and return
			else
				flash[:warning] = "Event start time has failed, try again"
				redirect_to update_start_time_event_path and return
			end
		end
	end

	def update_end_time
		@event = Event.new
	end

	def update_end_time_save
		@id = params[:id]
		@form = params[:event]
		@event = Event.find_by_id(@id)
		if !@event
			flash[:warning] = "Event does not exist."
		else
			@event.event_end_time = Date.new( @form["event_end_time(1i)"].to_i, @form["event_end_time(2i)"].to_i, @form["event_end_time(3i)"].to_i)
			if@event.save
				flash[:notice] = "Event end time has been modified"
				redirect_to show_event_path and return
			else
				flash[:warning] = "Event end time has failed, try again"
				redirect_to update_end_time_event_path and return
			end
		end
	end

	def update_cost
		@event = Event.new
	end

	def update_cost_save
		@id = params[:id]
		@form = params[:event]
		@event = Event.find_by_id(@id)
		if !@event
			flash[:warning] = "Event does not exist."
		else
			@event.cost = @form[:cost]
			if@event.save
				flash[:notice] = "Event cost has been modified"
				redirect_to show_event_path and return
			else
				flash[:warning] = "Event cost has failed, try again"
				redirect_to update_cost_event_path and return
			end
		end
	end

	def update_location
		@event = Event.new
	end

	def update_location_save
		@id = params[:id]
		@form = params[:event]
		@event = Event.find_by_id(@id)
		if !@event
			flash[:warning] = "Event does not exist."
		else
			@event.location = @form[:location]
			if@event.save
				flash[:notice] = "Event location has been modified"
				redirect_to show_event_path and return
			else
				flash[:warning] = "Event location has failed, try again"
				redirect_to update_location_event_path and return
			end
		end
	end

	def update_description
		@event = Event.new
	end

	def update_description_save
		@id = params[:id]
		@form = params[:event]
		@event = Event.find_by_id(@id)
		if !@event
			flash[:warning] = "Event does not exist."
		else
			@event.description = @form[:description]
			if@event.save
				flash[:notice] = "Event description has been modified"
				redirect_to show_event_path and return
			else
				flash[:warning] = "Event description has failed, try again"
				redirect_to update_description_event_path and return
			end
		end
	end


	def update_registration_deadline
		@event = Event.new
	end

	def update_registration_deadline_save
		@id = params[:id]
		@form = params[:event]
		@event = Event.find_by_id(@id)
		if !@event
			flash[:warning] = "Event does not exist."
		else
			@event.registration_deadline = Date.new( @form["registration_deadline(1i)"].to_i, @form["registration_deadline(2i)"].to_i, @form["registration_deadline(3i)"].to_i)
			if@event.save
				flash[:notice] = "Event registration deadline has been modified"
				redirect_to show_event_path and return
			else
				flash[:warning] = "Event registration deadline has failed, try again"
				redirect_to update_registration_deadline_event_path and return
			end
		end
	end

	def update_food
		@event = Event.new
	end

	def update_food_save
		@id = params[:id]
		@form = params[:event]
		@event = Event.find_by_id(@id)
		if !@event
			flash[:warning] = "Event does not exist."
		else
			@event.food = @form[:food]
			if@event.save
				flash[:notice] = "Event food has been modified"
				redirect_to show_event_path and return
			else
				flash[:warning] = "Event food has failed, try again"
				redirect_to update_food_event_path and return
			end
		end
	end

	def delete
		@id = params[:id]
		@event = Event.find_by_id(@id)
		@myevent = Myevent.find_all_by_event_id(@id)
		if !@event
			flash[:warning] = "Event does not exist."
		else
			@event.destroy
			flash[:notice] = "#{@event.name} has been deleted."
			if !@myevent
			else
				@myevent.each do |e|
					e.destroy
				end
			end
		end
		redirect_to home_path and return
	end
end
