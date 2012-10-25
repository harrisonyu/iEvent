class SpeakerController < ApplicationController

	def new
		@speakers = Person.all
		@speaker = Speaker.new
	end

	def create
		@id = params[:id]
		@form = params[:speaker]
		@speaker = Speaker.new
		@speaker.event_id = @id
		@speaker.speakerName = @form[:speakerName]
		if Person.find_by_name(@form[:speakerName]) == nil
			flash[:warning] = "Invalid Speaker"
			redirect_to new_speaker_path and return
		end
		if @speaker.save
			flash[:notice] = "Speaker has been added"
			redirect_to show_event_path and return #maybe change this
		else
			flash[:warning] = "Invalid Speaker"
			redirect_to new_speaker_path and return
		end
	end

	def delete
		@id = params[:id]
		@speaker = Speaker.find_by_event_id(@id)
		if !@speaker
			flash[:warning] = "Invalid Speaker"
		else
			@speaker.destroy
			flash[:notice] = "Speaker has been deleted"
		end
		redirect_to show_event_path and return

	end

end

