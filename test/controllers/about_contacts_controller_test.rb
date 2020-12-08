require 'test_helper'

class AboutContactsControllerTest < ActionDispatch::IntegrationTest
  test "should get about" do
    get about_contacts_about_url
    assert_response :success
  end

  test "should get contact" do
    get about_contacts_contact_url
    assert_response :success
  end

end
