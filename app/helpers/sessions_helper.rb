module SessionsHelper

	def sign_in(artist)
	    remember_token = Artist.new_remember_token
	    cookies.permanent[:remember_token] = remember_token
	    artist.update_attribute(:remember_token, Artist.encrypt(remember_token))
	    self.current_artist = artist
  	end

  	def sign_out
  		current_artist.update_attribute(:remember_token,
                                  Artist.encrypt(Artist.new_remember_token))
    	cookies.delete(:remember_token)
	    self.current_artist = nil
  	end

  	def signed_in?
    	!current_artist.nil?
  	end

  	def current_artist=(artist)
    	@current_artist = artist
  	end

  	def current_artist
  		remember_token = Artist.encrypt(cookies[:remember_token])
  		@current_artist ||= Artist.find_by(remember_token: remember_token)
  	end

    def current_artist?(artist)
      return current_artist == artist
    end

end
