class SessionsController < ApplicationController
	def new 
	end

	def create
		#sign in
		user = User.find_by_email(params[:session][:email].downcase)
		if user && user.authenticate(params[:session][:password])
			#Success
			sign_in user
			redirect_back_or user;	
		else
			#Fail
			flash.now[:error] = 'Invalid email/password combination'
			render 'new'
		end
	end

	def destroy
		sign_out
		redirect_to root_url
	end
end
