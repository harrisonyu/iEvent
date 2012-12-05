class EventController < ApplicationController

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
#		@id = params[:id]
		@form = params[:event]
		@event = Event.new
		@event.name = @form[:name]
		@event.event_start_time = DateTime.new( @form["event_start_time(1i)"].to_i, @form["event_start_time(2i)"].to_i, @form["event_start_time(3i)"].to_i, @form["event_start_time(4i)"].to_i, @form["event_start_time(5i)"].to_i, 0)
		@event.event_end_time = DateTime.new( @form["event_end_time(1i)"].to_i, @form["event_end_time(2i)"].to_i, @form["event_end_time(3i)"].to_i, @form["event_end_time(4i)"].to_i, @form["event_end_time(5i)"].to_i, 0)
		@event.cost = @form[:cost]
		@event.location = @form[:location]
		@event.description = @form[:description]
		@event.registration_deadline = DateTime.new( @form["registration_deadline(1i)"].to_i, @form["registration_deadline(2i)"].to_i, @form["registration_deadline(3i)"].to_i, @form["registration_deadline(4i)"].to_i, @form["registration_deadline(5i)"].to_i, 0)
		@event.food = @form[:food]
		@event.event_type = @form[:event_type]
		@event.createdby_user_id = current_user.id
		if @event.save
			flash[:notice] = "#{@event.name} has been made."
			redirect_to home_path and return
		else
			flash[:warning] = "Invalid event, try again."
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
			@event.event_start_time = DateTime.new( @form["event_start_time(1i)"].to_i, @form["event_start_time(2i)"].to_i, @form["event_start_time(3i)"].to_i, @form["event_start_time(4i)"].to_i, @form["event_start_time(5i)"].to_i, 0)
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
			@event.event_end_time = DateTime.new( @form["event_end_time(1i)"].to_i, @form["event_end_time(2i)"].to_i, @form["event_end_time(3i)"].to_i, @form["event_end_time(4i)"].to_i, @form["event_end_time(5i)"].to_i, 0)
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
			@event.registration_deadline = DateTime.new( @form["registration_deadline(1i)"].to_i, @form["registration_deadline(2i)"].to_i, @form["registration_deadline(3i)"].to_i, @form["registration_deadline(4i)"].to_i, @form["registration_deadline(5i)"].to_i, 0)
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
