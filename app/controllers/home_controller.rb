class HomeController < ApplicationController
  
  def public

  end

  def about
  	
  end

  def index
  	@events = Event.all
  	@persons = Person.all
  end

  def search
    @search = Event.all
  end

  def search_results
    @form = params[:search]
    @search = Event.find(:all, :conditions => ['name LIKE? OR event_start_time LIKE? OR event_end_time LIKE? OR cost LIKE? OR location LIKE? OR description LIKE? OR registration_deadline LIKE? OR food LIKE? OR event_type LIKE?', @form, @form, @form, @form, @form, @form, @form, @form, @form])
    @search_person = Person.find(:all, :conditions => ['name LIKE? OR email LIKE? OR phone LIKE? OR address LIKE?', @form, @form, @form, @form])
  end

  def my_recommendation
    @myevents = Myevent.find_all_by_user_id(current_user.id)
    
  end
end
