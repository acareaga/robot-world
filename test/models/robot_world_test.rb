require_relative '../test_helper'

class RobotWorldTest < Minitest::Test

  def test_robot_is_created
    RobotWorld.create({ :name       => "Joe",
                         :department => "Toilets"
                        })
    robot = RobotWorld.find(1)

    assert_equal 1, robot.id
    assert_equal "Joe", robot.name
    assert_equal "Toilets", robot.department
  end

  def test_robot_update
    RobotWorld.create({ :name       => "Joe",
                         :department => "Toilets"
                        })
    robot = RobotWorld.find(1)
    assert_equal "Joe", robot.name

    RobotWorld.update(1, {:name => "Jimbo"})
    updated_name = RobotWorld.find(1)
    assert_equal "Jimbo", updated_name.name
  end

  def test_returns_all_robots
    RobotWorld.create({ :name       => "Joe",
                         :department => "Toilets"
                        })
    RobotWorld.create({ :name       => "Other Title",
                         :department => "more stuff"
                        })

    robot = RobotWorld.find(2)
    assert_equal "more stuff", robot.department
  end

  def test_robot_find
    RobotWorld.create({ :name       => "Joe",
                         :department => "Toilets"
                        })
    robot = RobotWorld.find(1)

    assert_equal 1, robot.id
  end

  def test_robot_delete_all
    RobotWorld.create({ :name       => "Joe",
                         :department => "Toilets"
                        })
    robot = RobotWorld.delete_all

    assert_equal 0, robot
  end
end
