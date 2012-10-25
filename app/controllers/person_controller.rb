class PersonController < ApplicationController

	def show
		@id = params[:id]
		@person = Person.find_by_id(@id)
		if !@person
			flash[:warning] = "Invalid Person"
			redirect_to home_path and return
		end
	end

	def new
		@person = Person.new
	end

	def create
		@id = params[:id]
		@form = params[:person]
		@person = Person.new
		@person.name = @form[:name]
		@person.email = @form[:email]
		@person.phone = @form[:phone]
		@person.address = @form[:address]
		if @person.save
			flash[:notice] = "Person has been created"
			redirect_to home_path and return #maybe change this
		else
			flash[:warning] = "Invalid Person"
			redirect_to new_person_path and return
		end
	end

	def update_name
		@person = Person.new
	end

	def update_name_save
		@id = params[:id]
		@form = params[:person]
		@person = Person.find_by_id(@id)
		if !@person
			flash[:warning] = "Person does not exist"
		else
			@person.name = @form[:name]
			if@person.save
				flash[:notice] = "Person name updated"
				redirect_to show_person_path and return
			else
				flash[:warning] = "Invalid Name"
				redirect_to update_name_person_path and return
			end
		end
	end

	def update_address
		@person = Person.new
	end

	def update_address_save
		@id = params[:id]
		@form = params[:person]
		@person = Person.find_by_id(@id)
		if !@person
			flash[:warning] = "Person does not exist"
		else
			@person.address = @form[:address]
			if@person.save
				flash[:notice] = "Person address updated"
				redirect_to show_person_path and return
			else
				flash[:warning] = "Invalid address"
				redirect_to update_address_person_path and return
			end
		end
	end
	
	def update_email
		@person = Person.new
	end

	def update_email_save
		@id = params[:id]
		@form = params[:person]
		@person = Person.find_by_id(@id)
		if !@person
			flash[:warning] = "Person does not exist"
		else
			@person.email = @form[:email]
			if@person.save
				flash[:notice] = "Person email updated"
				redirect_to show_person_path and return
			else
				flash[:warning] = "Invalid email"
				redirect_to update_email_person_path and return
			end
		end
	end
	
	def update_phone
		@person = Person.new
	end

	def update_phone_save
		@id = params[:id]
		@form = params[:person]
		@person = Person.find_by_id(@id)
		if !@person
			flash[:warning] = "Person does not exist"
		else
			@person.phone = @form[:phone]
			if@person.save
				flash[:notice] = "Person phone updated"
				redirect_to show_person_path and return
			else
				flash[:warning] = "Invalid Phone"
				redirect_to update_phone_person_path and return
			end
		end
	end
	

	def delete
		@id = params[:id]
		@person = Person.find_by_id(@id)
		if !@person
			flash[:warning] = "Invalid Person"
		else
			@person.destroy
			flash[:notice] = "Person has been deleted"
		end
		redirect_to home_path and return

	end

end

