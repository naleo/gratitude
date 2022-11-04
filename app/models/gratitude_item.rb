class GratitudeItem < ApplicationRecord
  has_many :reflections
  belongs_to :user
  validates :name, presence: true

end
