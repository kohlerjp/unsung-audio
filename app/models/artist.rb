class Artist < ActiveRecord::Base
	before_create :create_remember_token
	before_save {self.email = self.email.downcase}
	has_one :profile, class_name: 'ArtistProfile'
	has_many :songs, class_name: 'Song', dependent: :destroy

	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, presence:true, format: { with: VALID_EMAIL_REGEX }, uniqueness:{case_sensitive:false}

	has_secure_password
	validates :password, length: { minimum: 6 }

	#pretty(er) url
	def to_param
		"#{id} #{name}".parameterize
	end

	def Artist.new_remember_token
    	SecureRandom.urlsafe_base64
  	end

  	def Artist.encrypt(token)
 	   Digest::SHA1.hexdigest(token.to_s)
 	 end

	private

		def create_remember_token
			self.remember_token = Artist.encrypt(Artist.new_remember_token)
		end
end
