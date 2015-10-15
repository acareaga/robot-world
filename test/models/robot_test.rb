require_relative '../test_helper'

class RobotTest < Minitest::Test

  def test_attributes_are_assigned_correctly
    skip
    robot = Robot.new({"id"          => "1",
                       "name"       => "Joe",
                       "department" => "Toilets"
                      })

    assert_equal "1", robot.id
    assert_equal "My Task", robot.title
    assert_equal "do stuff", robot.description
  end
end
