class User < ActiveRecord::Base
  has_secure_password
  has_many :events, dependent: :destroy
  has_many :joins, dependent: :destroy
  has_many :joining_event, through: :joins, source: :event
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :first_name, :last_name, :email, :city, :state, presence: true
  validates :email, uniqueness: true, format: { with: VALID_EMAIL_REGEX }
  before_save { |user| user.email = user.email.downcase }
  validates :password, length: { minimum: 8}, on: create
end
