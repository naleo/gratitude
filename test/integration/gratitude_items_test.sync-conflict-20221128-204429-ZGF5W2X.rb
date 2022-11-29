require "test_helper"

class GratitudeItemsTest < ActionDispatch::IntegrationTest
  test "gratitude item index page shows only logged in users tasks" do
    user = login_user
    gratitude_item1 = FactoryBot.create :gratitude_item, user: user
    gratitude_item2 = FactoryBot.create :gratitude_item, user: user
    gratitude_item3 = FactoryBot.create :gratitude_item
    
    visit gratitude_items_path

    assert_text gratitude_item1.name
    assert_text gratitude_item2.name
    refute page.has_content?(gratitude_item3.name)
  end
end
