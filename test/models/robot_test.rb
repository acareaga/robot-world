require_relative '../test_helper'

class RobotTest < Minitest::Test
  def test_attributes_are_assigned_correctly
    robot = Robot.new({"id"          => "1",
                       "name"       => "Joe",
                       "department" => "Toilets"
                      })

    assert_equal "1", robot.id
    assert_equal "Joe", robot.name
    assert_equal "Toilets", robot.department
  end
end
