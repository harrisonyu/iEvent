class EventController < ApplicationController

	def show
		@id = params[:id]
		@event = Event.find_by_id(@id)
		if !@event
			flash[:warning] = "That event does not exist!"
			redirect_to home_path
		end
	end

	def new
		@event = Event.new
	end

	def create
		@id = params[:id]
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
		if @event.save
			flash[:notice] = "#{@event.name} has been made."
			redirect_to home_path and return
		else
			flash[:warning] = "Invalid event, try again."
			redirect_to new_event_path and return
		end
	end

	def delete
		@id = params[:id]
		@event = Event.find_by_id(@id)
		if !@event
			flash[:warning] = "Event does not exist."
		else
			@event.destroy
			flash[:notice] = "#{@event.name} has been deleted."
		end
		redirect_to home_path and return
	end
end
