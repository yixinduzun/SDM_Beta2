class SessionsController < ApplicationController
	protect_from_forgery
	include SessionsHelper
	def new
	end
	
	def create
		user = User.find_by_email(params[:session][:email].downcase)
		if user && user.authenticate(params[:session][:password])
			#Sign the user in and redirect to user's page
			redirect_to "http://www.csdn.net/"
		else
			#Create and error message and re-render the signin page
			flash.now[:error] = 'Invalid email/password combination'
			render 'new'
		end
	end
	
	def destroy
		sign_out
		redirect_to root_path
	end
end
