class SessionsController < ApplicationController
  def new
  	#Login page new.html.erb
  end

  def create
  	user = User.find_by(username: params[:user][:username])
  	password = params[:user][:password]

  	if user && user.authenticate(password)
  		redirect_to root_path, notice: 'Login Successful.'
  	else
  		redirect_to login_path, alert: 'Incorrect Username or Password'
  	end

  end

  def destroy
  end
end
