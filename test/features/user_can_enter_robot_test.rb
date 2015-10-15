require_relative '../test_helper'

class NewRobotTest < FeatureTest

  def test_user_can_create_a_new_robot
    skip
    visit '/robots/new'

    assert_equal '/robots/new', current_path

    fill_in('robot[name]', with: "Joe")
    fill_in('robot[department]', with: "Toilets")
    click_button "Submit"

    assert_equal "/robots", current_path
    assert page.has_content?("Joe")
    # assert page.has_content?("Walk the dog")
  end
end
