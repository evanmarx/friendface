class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
  			 :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :first_name, :last_name, :username,
  								:password, :password_confirmation, :remember_me
  # attr_accessible :title, :body

  validates :first_name, :last_name, :username, presence: true
  validates :username, uniqueness: true

  has_one :profile, dependent: :destroy

  has_many :friendships, foreign_key: :user_id, dependent: :destroy
  has_many :occurances_as_friend, class_name: "Friendship", 
           foreign_key: :friend_id, dependent: :destroy
  has_many :friends, through: :friendships, source: :friend

  has_many :friend_requests, foreign_key: :user_id
  has_many :requests_to_be_friends, class_name: "FriendRequest", 
           foreign_key: :requestee_id

  def full_name
  	self.first_name + " " + self.last_name
  end

end
