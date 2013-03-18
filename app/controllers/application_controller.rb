class ApplicationController < ActionController::Base
  
  def login_required
    if session[:user]
      return true
    end
    flash[:warning]='Please login to continue'    
    redirect_to :controller => "sessions", :action => "new"
    return false 
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def redirect_to_stored
  	redirect_to :controller=>'sessions', :action=>'index'
  end

end
