class HomeController < ApplicationController
  
  def public

  end

  def about
  	
  end

  def index
  	@events = Event.all
  end

end
