class Song < ActiveRecord::Base
	default_scope -> { order('bumps DESC') }
	belongs_to :artist, class_name:'Artist'
end
