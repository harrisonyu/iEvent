class MyeventController < ApplicationController
	def add
		@id = params[:id]
		@myevent = Myevent.new
		@event = Event.find_by_id(@id)
		if !@event
			flash[:warning] = "Event does not exist."
		else
		end
		if Myevent.find_by_event_id(@event)
			flash[:warning] = "Event has already been added"
		else
			@myevent.event_id = @id
			@myevent.user_id = current_user.id
			if @myevent.save
				flash[:notice] = "Event has been added to your events."
				redirect_to home_path and return
			else
				flash[:warning] = "Event adding failed."
				redirect_to home_path and return
			end
		end
		redirect_to home_path and return
	end

	def show
		@user = current_user.id
		@myevents = Myevent.find_all_by_user_id(@user)
		if !@myevents
			flash[:warning] = "No Events"
			redirect_to home_path and return
		end
	end

	def remove
		@id = params[:id]
		@myevent = Myevent.find_by_id(@id)
		if !@myevent
			flash[:warning] = "That event does not exist in your events!"
		else
			@myevent.destroy
			flash[:notice] = 'Event has been removed from your events'
		end
		redirect_to myevent_show_path and return
	end
end