class HomeController < ApplicationController
  
  def public

  end

  def about
  	
  end

  def index
  	@events = Event.all
  	@persons = Person.all
  end

  def search_query

  end

  def search_results
	/@form = params[:search]/
	@search = Event.find(:all, :conditions => ['name LIKE? OR description like?', "Hello", "Hello"])
	redirect_to search_results_path and return
  end
end
