require_relative '../test_helper'

class RosterTest < FeatureTest

  def test_user_can_edit_a_task
    skip
    RobotWorld.create(name: "Joe", department: "Toilets")

    visit '/robots'
    click_link "Edit"

    assert_equal "/robots/1/edit", current_path

    fill_in("robot[name]", with: "Jimbo")
    fill_in("robot[department]", with: "Skiing")
    click_button "Submit"

    assert page.has_content?("Skiing")

  end

  def test_user_can_click_robot
    skip
    visit '/robots'

    assert_equal '/robots', current_path
    within(".row") do
      assert page.click_link_or_button("Dog")
    end
  end
end
