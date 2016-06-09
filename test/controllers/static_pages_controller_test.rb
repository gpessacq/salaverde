require 'test_helper'

class StaticPagesControllerTest < ActionController::TestCase
  test "should get about" do
    get :about, locale: 'en'
    assert_response :success
  end

end
