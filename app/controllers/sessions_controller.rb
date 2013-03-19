class SessionsController < ApplicationController
	before_filter :current_user

	def new
	end

	def index
      @user = @current_user 
      @projects = @current_user.projects     

      respond_to do |format|
        format.html # show.html.erb
        format.json { render json: @user }
      end
    end

	def create
	  user = User.authenticate(params[:email], params[:password])
	  if user
	    session[:user_id] = user.id	    
	    puts "Logged in!"
	    redirect_to_stored
	  else
	    flash.now.alert = "Invalid email or password"
	    render "new"
	  end
	end

	def destroy
	  session[:user_id] = nil
	  puts "Logged out"
	  redirect_to_stored
	end
end