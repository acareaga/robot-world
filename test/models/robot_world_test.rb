require_relative '../test_helper'

class RobotWorldTest < Minitest::Test
  def create_robots(num)
    num.times do |i|
      RobotWorld.create({ :name       => "#{i+1} name",
                          :department => "#{i+1} department"})
    end
  end

  def test_robot_is_created
    create_robots(1)

    robot = RobotWorld.find(1)

    assert_equal "1 name", robot.name
    assert_equal "1 department", robot.department
    assert_equal RobotWorld.all.first.id, robot.id
  end

  def test_robot_update
    skip
    create_robots(1)

    RobotWorld.update(1, {name: "jimbo", department: "cleaning"})

    robot = RobotWorld.find(1)

    assert_equal "jimbo", robot.name
    assert_equal "cleaning", robot.department
  end

  def test_it_finds_all_robots
    skip
    create_robots(2)

    assert_equal 2, RobotWorld.all.count
  end

  def test_it_finds_a_robot_by_id
    skip
    create_robots(2)

    assert_equal "1 name", RobotWorld.find(1).title
  end

  def test_it_deletes_a_robot
    skip
    create_robots(3)
    total = RobotWorld.all.count

    RobotWorld.delete(RobotWorld.all.first.id)

    assert_equal (total - 1), RobotWorld.all.count
  end
end
