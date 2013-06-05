class Notification < ActiveRecord::Base
	attr_accessible :notifiable_type, :notifiable_id
	
	belongs_to :imageable, polymorphic: true
end