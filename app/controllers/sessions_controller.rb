class SessionsController < ApplicationController
  def new
  end

  def create
  	artist = Artist.find_by(email:params[:session][:email].downcase)
  	if artist && artist.authenticate(params[:session][:password])
  		sign_in(artist)
  		redirect_to artist
  	else
  		flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
  	end
  end

  def destroy
  	sign_out
  	redirect_to(root_url)
  end
end
