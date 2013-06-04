class Profile < ActiveRecord::Base
	attr_accessible :user_id, :sex, :location, :birthday

	validates :user_id, presence: true

	validates :sex, :location, :birthday, presence: true, on: :update

	belongs_to :user
end