class Profile < ActiveRecord::Base
	attr_accessible :user_id, :sex, :location, :birthday
end