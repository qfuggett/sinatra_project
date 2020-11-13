class Exercise < ActiveRecord::Base
  belongs_to :user
  validates :name, :duration, presence: true
end