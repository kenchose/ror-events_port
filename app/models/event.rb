class Event < ActiveRecord::Base
  belongs_to :user
  # has_many :joins
  has_many :joins, dependent: :destroy
  has_many :users, through: :joins
  has_many :messages, dependent: :destroy
  # has_many :messages, through: :users
  validates :name, :date, :city, :state, :detail, :user_id, presence: true
  def cannot_be_before
    if date.present? && date < Date.today
      errors.add(:date, "Can only schedule future/today events.")
    end
  end
end
