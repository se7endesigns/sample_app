class SessionsController < ApplicationController

	def new
	end

	def create
		user = User.find_by(email: params[:session][:email].downcase)
		if user && user.authenticate(params[:session][:password])
			#sign in
			sign_in user
			redirect_to user
		else 
			flash.now[:error] = 'Invalid email/password combination'
			render 'new'
		end
	##	render 'new'		
	end

	def destroy
		sign_out
		redirect_to root_url
	end

end
