require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  
  # setup function is run before every test
  def setup
    @base_title = "Ruby on Rails Tutorial Sample App"
  end

  
  # test gets a URL and verifies/asserts that the result is a success
  test "should get home" do
    get root_path # issues GET request to home url
    assert_response :success  # receive a 'success' status code in response
    assert_select "title", "Ruby on Rails Tutorial Sample App" # checks the presense of HTML tag
  end

  test "should get help" do
    get help_path
    assert_response :success
    assert_select "title", "Help | #{@base_title}"

  end
  
  test "should get about" do
    get about_path
    assert_response :success
    assert_select "title", "About | #{@base_title}"
  end
  
  test "should get contact" do
    get contact_path
    assert_response :success
    assert_select "title", "Contact | #{@base_title}"
  end
  
  test "should get root" do
    get root_url
    assert_response :success
  end
  
end
