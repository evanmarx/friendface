class Message < ActiveRecord::Base
	attr_accessible :user_id, :recipient_id, :body, :read

	validates :user_id, :recipient_id, :body, presence: true

	belongs_to :user
	belongs_to :recipient, class_name: "User", foreign_key: :recipient_id

	has_many :notifications, as: :notifiable 
end 