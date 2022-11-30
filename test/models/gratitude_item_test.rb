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

  test 'requires a name' do
    gratitude_item = FactoryBot.build :gratitude_item
    gratitude_item.name = ''

    refute gratitude_item.valid?
  end
end
