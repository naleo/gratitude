require 'test_helper'

class GratitudeItemsTest < ActionDispatch::IntegrationTest
  test 'only logged in users can see gratitude items' do
    visit root_path
    refute page.has_content?('Gratitudes')

    visit gratitude_items_path

    assert_equal page.current_path, login_path
    assert_text 'User must be logged in'
  end

  test 'gratitude item index page shows only logged in users gratitude items' do
    user = login_user
    gratitude_item1 = FactoryBot.create :gratitude_item, user: user
    gratitude_item2 = FactoryBot.create :gratitude_item, user: user
    gratitude_item3 = FactoryBot.create :gratitude_item
    
    visit gratitude_items_path

    assert_text gratitude_item1.name
    assert_text gratitude_item2.name
    assert_no_text gratitude_item3.name
    refute page.has_content?(gratitude_item3.name)

  end

  test 'users can create a new gratitude item' do
    assert true
  end
end
