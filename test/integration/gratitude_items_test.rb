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
    login_user

    visit gratitude_items_path
    click_on 'New Gratitude'
    fill_in 'gratitude_item[name]', with: 'Test Gratitude Item for new test'
    fill_in 'gratitude_item[details]', with: 'DETAILS LONG SENTENCE'
    click_button 'Create Gratitude item'

    assert_text 'Gratitude Created'
    assert_text 'Test Gratitude Item for new test'
  end

  test 'users can edit a gratitude item' do
    user = login_user
    gratitude_item = FactoryBot.create :gratitude_item, user: user

    visit gratitude_item_path(gratitude_item)

    click_on 'Edit Gratitude'

    fill_in 'gratitude_item[name]', with: 'Edited Gratitude Item Name'
    click_button 'Update Gratitude item'

    assert_text 'Gratitude was Updated'
    assert_text 'Edited Gratitude Item Name'
  end

  test 'users can delete a gratitude item' do
    user = login_user
    gratitude_item = FactoryBot.create :gratitude_item, user: user

    visit gratitude_item_path(gratitude_item)
    click_on 'Delete Gratitude'

    assert_text 'Gratitude was Deleted'
    assert_no_text gratitude_item.name
  end
end
