class SponsorController < ApplicationController

	def new
		@sponsors = Person.all
		@sponsor = Sponsor.new
	end

	def create
		@id = params[:id]
		@form = params[:sponsor]
		@sponsor = Sponsor.new
		@sponsor.event_id = @id
		@sponsor.sponsorName = @form[:sponsorName]
		if Person.find_by_name(@form[:sponsorName]) == nil
			flash[:warning] = "Invalid Sponsor"
			redirect_to new_sponsor_path and return
		end
		if @sponsor.save
			flash[:notice] = "Sponsor has been added"
			redirect_to show_event_path and return #maybe change this
		else
			flash[:warning] = "Invalid Sponsor"
			redirect_to new_sponsor_path and return
		end
	end

	def delete
		@id = params[:id]
		@sponsor = Sponsor.find_by_event_id(@id)
		if !@sponsor
			flash[:warning] = "Invalid Sponsor"
		else
			@sponsor.destroy
			flash[:notice] = "Sponsor has been deleted"
		end
		redirect_to show_event_path and return

	end

end

