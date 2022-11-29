require 'test_helper'

class GratitudeItemTest < ActiveSupport::TestCase
  test 'has a valid factory' do
    gratitude_item = FactoryBot.build :gratitude_item

    assert gratitude_item.valid?
  end

  test 'requires a user' do
    gratitude_item = FactoryBot.build :gratitude_item
    gratitude_item.user = nil

    refute gratitude_item.valid?
  end
  
  test 'requires a title' do
    gratitude_item = FactoryBot.build :gratitude_item
    gratitude_item.title = ""

    refute gratitude_item.valid?
  end
end
