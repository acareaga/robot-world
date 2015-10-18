require_relative '../test_helper'

class RobotTest < Minitest::Test
  def test_attributes_are_assigned_correctly
    robot = Robot.new({:id          => 1,
                       :name        => "Joe",
                       :city       => "Bellingham",
                       :state      => "Washington",
                       :avatar     => "skier",
                       :birthday   => "12/20/89",
                       :date_hired => "06/20/12",
                       :department => "Recreation"
                      })

    assert_equal 1, robot.id
    assert_equal "Joe", robot.name
    assert_equal "Bellingham", robot.city
    assert_equal "Washington", robot.state
    assert_equal "skier", robot.avatar
    assert_equal "12/20/89", robot.birthday
    assert_equal "06/20/12", robot.date_hired
    assert_equal "Recreation", robot.department
  end
end
