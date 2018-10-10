class Event < ActiveRecord::Base
  belongs_to :user
  has_many :joins, dependent: :destroy
  has_many :users, through: :joins
  validates :name, :date, :location, presence: true
end
