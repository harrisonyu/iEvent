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
    @form = params[:search].to_s
    #@search = Event.all(:conditions => ["name like :form|| location like :form || cost like :form || description like :form || food like :form || event_type like :form", {:form => "@form"}])
    @search = Event.find(:all, :conditions => ['name =? OR cost =? OR location =? OR description =? OR food =? OR event_type =?', @form, @form, @form, @form, @form, @form])
    #@search_person = Person.all(:conditions => ["name like @form || email like @form || address like @form"])
    @search_person = Person.find(:all, :conditions => ['name =? OR email =? OR address =?', @form, @form, @form])
    #@search = Event.find(:all, :conditions => ['name LIKE? OR event_start_time LIKE? OR event_end_time LIKE? OR cost LIKE? OR location LIKE? OR description LIKE? OR registration_deadline LIKE? OR food LIKE? OR event_type LIKE?', @form, @form, @form, @form, @form, @form, @form, @form, @form])
    #@search_person = Person.find(:all, :conditions => ['name LIKE? OR email LIKE? OR phone LIKE? OR address LIKE?', @form, @form, @form, @form])
    @join = Sponsor.find(:all, :conditions => ['sponsorName =?', @form])
  end

  def my_recommendation
    @myevents = Myevent.find_all_by_user_id(current_user.id)
  end
end
