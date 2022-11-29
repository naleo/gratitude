require 'test_helper'

class UsersTest < ActionDispatch::IntegrationTest
  test 'users can sign up' do
    visit root_path

    click_on 'Sign Up'

    fill_in 'user[name]', with: 'Test Signup'
    fill_in 'user[email]', with: 'signup@test.com'
    fill_in 'user[password]', with: 'secret'
    fill_in 'user[password_confirmation]', with: 'secret'

    click_button 'Signup'

    assert_equal page.current_path, root_path
    assert_text 'signed up'

    assert_text 'Logout'
    assert_text 'Test Signup'
    refute page.has_content?('Login')
  end

  test 'users cannot sign up with errors' do
    visit signup_path

    fill_in 'user[name]', with: 'Test Signup'
    fill_in 'user[email]', with: 'signuptest.com' # no @ in email
    fill_in 'user[password]', with: 'secret'
    fill_in 'user[password_confirmation]', with: 'secret'

    click_button 'Signup'

    assert_text 'Email Must have an @'
  end

end
