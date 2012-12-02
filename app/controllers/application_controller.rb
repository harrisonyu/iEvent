class ApplicationController < ActionController::Base
  protect_from_forgery
  protected

  def current_user
    @current_user ||= User.find_by_id(session[:user_id])
  end

  def signed_in?
    !!current_user
  end

  helper_method :current_user, :signed_in?, :authenticate_user!, :correct_user?

  def current_user=(user)
    @current_user = user
    session[:user_id] = user.id
  end
  
  def authenticate_user!
    if !current_user
      flash[:warning] = 'You need to sign in for access to this page.'
      redirect_to root_url, :warning => 'You need to sign in for access to this page.'
    end
  end
  
  def correct_user?
    @user = User.find(params[:id])
    unless current_user == @user
      redirect_to root_url, :alert => "Access denied."
    end
  end
  
end
