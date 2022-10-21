class Reflection < ApplicationRecord
  belongs_to :gratitude_item

  validates :reflection_date, presence: true
end
