require_relative '../test_helper'

class GreetingTest < FeatureTest

  def test_user_can_see_greeting
    skip
    visit '/'

    assert_equal '/', current_path
    within("#greeting") do
      assert page.has_content?("Welcome to Robot World")
    end
  end
end
