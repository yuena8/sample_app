require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest
  
  test "invalid signup information" do
    get signup_path 
    assert_no_difference 'User.count' do
      #issue POST request to users_path to test form submission
      #comparision between User.count before and after the block
      post users_path, params: { user: {name: "", 
                        email: "user@invalid",
                        password: "foo",
                        password_confirmation: "bar" } }
    end
    # failed submission re-renders the new action
    assert_template 'users/new'
    assert_select 'div#error_explanation'
    assert_select 'div.field_with_errors'
  end
  
  test "valid signup information" do
    get signup_path
    assert_difference 'User.count', 1 do
      post users_path, params: { user: { name: "example user",
                              email: "user@example.com",
                              password: "password",
                              password_confirmation: "password" } }
    end 
    follow_redirect!
    assert_template 'users/show'
    assert is_logged_in?
    
  end 
end
