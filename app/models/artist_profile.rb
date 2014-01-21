class ArtistProfile < ActiveRecord::Base
	 belongs_to :artist, :class_name => 'Artist'
end
