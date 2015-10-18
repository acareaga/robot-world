require_relative '../test_helper'

class UserSeesAllRobotsTest < FeatureTest
  def create_robots(num)
    num.times do |i|
      RobotWorld.create({ :name       => "#{i+1} name",
                          :city       => "#{i+1} city",
                          :state      => "#{i+1} state",
                          :avatar     => "#{i+1} avatar",
                          :birthday   => "#{i+1} birthday",
                          :date_hired => "#{i+1} date hired",
                          :department => "#{i+1} department"
                        })
    end
  end

  def test_new_robot_creation
    visit("/")
    click_link("New Robot")

    fill_in("Name", with: "Joe")
    fill_in("Department", with: "VFX")
    assert_equal "/robots/new", current_path
    click_button("Submit")
    assert_equal "/robots", current_path

    within(".container") do
      assert page.has_content?("Robot Roster")
    end
  end

  def test_user_can_edit_a_robot
    create_robots(1)

    visit "/robots"
    click_link("Edit")
    fill_in("Name", with: "Joe")
    fill_in("Department", with: "VFX")
    click_button("Submit")

    assert_equal "/robots", current_path
    within(".container") do
      assert page.has_content?("Robot Roster")
    end
  end

  def test_user_can_delete_a_robot
    create_robots(1)

    visit "/robots"
    click_button("Delete")

    refute page.has_content?("new robot")
  end

  def test_a_user_can_see_a_single_robot
    create_robots(1)

    visit "/robots"

    click_link("1 name")
    assert_equal "/robots/#{RobotWorld.all.first.id}", current_path
    assert page.has_content?("1 name")
  end
end
