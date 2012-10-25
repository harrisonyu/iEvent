class ArtistController < ApplicationController

	def new
		@artists = Person.all
		@artist = Artist.new
	end

	def create
		@id = params[:id]
		@form = params[:artist]
		@artist = Artist.new
		@artist.event_id = @id
		@artist.artistName = @form[:artistName]
		if Person.find_by_name(@form[:artistName]) == nil
			flash[:warning] = "Invalid Artist"
			redirect_to new_artist_path and return
		end
		if @artist.save
			flash[:notice] = "Artist has been added"
			redirect_to show_event_path and return #maybe change this
		else
			flash[:warning] = "Invalid Artist"
			redirect_to new_artist_path and return
		end
	end

	def delete
		@id = params[:id]
		@artist = Artist.find_by_event_id(@id)
		if !@artist
			flash[:warning] = "Invalid Artist"
		else
			@artist.destroy
			flash[:notice] = "Artist has been deleted"
		end
		redirect_to show_event_path and return

	end

end

