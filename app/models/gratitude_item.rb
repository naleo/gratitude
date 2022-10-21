class GratitudeItem < ApplicationRecord
  has_many :reflections
  validates :name, presence: true

end
