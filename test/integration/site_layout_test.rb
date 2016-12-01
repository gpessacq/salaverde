require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest

  test "layout links" do
    get root_path, locale: 'en' 
    assert_template 'salas/index'
#    assert_select "a[href=?']'", root_path, count: 2
		assert_equal '/', root_path
    assert_select "a[href=?]", about_path
  end
end
