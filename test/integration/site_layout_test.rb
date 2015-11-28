require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  test "layout links" do
  	get "home_path"
  	assert_template "static_pages/home"

  	assert_select "a[href=?]" , home_path
  	assert_select "a[href=?]" , about_path
  	assert_select "a[href=?]" , help_path


  end
end
