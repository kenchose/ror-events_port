class Event < ActiveRecord::Base
  belongs_to :user
  # has_many :joins
  has_many :joins, dependent: :destroy
  has_many :users, through: :joins
  has_many :messages, through: :users
  validates :name, :date, :city, :state, :detail, :user_id, presence: true
end
