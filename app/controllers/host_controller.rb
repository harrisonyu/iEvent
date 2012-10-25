class HostController < ApplicationController

	def new
		@hosts = Person.all
		@host = Host.new
	end

	def create
		@id = params[:id]
		@form = params[:host]
		@host = Host.new
		@host.event_id = @id
		@host.hostName = @form[:hostName]
		if Person.find_by_name(@form[:hostName]) == nil
			flash[:warning] = "Invalid Host"
			redirect_to new_host_path and return
		end
		if @host.save
			flash[:notice] = "Host has been added"
			redirect_to show_event_path and return #maybe change this
		else
			flash[:warning] = "Invalid Host"
			redirect_to new_host_path and return
		end
	end

	def delete
		@id = params[:id]
		@host = Host.find_by_event_id(@id)
		if !@host
			flash[:warning] = "Invalid Host"
		else
			@host.destroy
			flash[:notice] = "Host has been deleted"
		end
		redirect_to show_event_path and return

	end

end

