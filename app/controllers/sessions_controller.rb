class SessionsController < ApplicationController
	def create
		auth = request.env['omniauth.auth']
		user = User.find_by_provider_and_uid(auth['provider'], auth['uid']) || User.create_with_omniauth(auth)
		session[:user_id]=	user.id
		session[:user_name]=	user.name
		redirect_to root_url, notice: 'Signed in' 
	end
	
	def destroy
  	session[:user_id] = nil
  	session[:user_name]= nil
  	redirect_to root_url, :notice => "Signed out!"
	end
end
