require_relative '../test_helper'

class RobotWorldTest < Minitest::Test
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

  def test_robot_is_created
    create_robots(1)

    robot = RobotWorld.find(RobotWorld.all.first.id)

    assert_equal "1 name", robot.name
    assert_equal "1 department", robot.department
    assert_equal RobotWorld.all.first.id, robot.id
  end

  def test_robot_update
    create_robots(1)

    RobotWorld.update(RobotWorld.all.first.id, {  name: "Joe",
                                                  city: "Tacoma",
                                                  state: "Washington",
                                                  avatar: "CP30",
                                                  birthday: "07/09/92",
                                                  date_hired: "10/10/10",
                                                  department: "VFX"
                                                })

    robot = RobotWorld.find(RobotWorld.all.first.id)

    assert_equal "Joe", robot.name
    assert_equal "Tacoma", robot.city
    assert_equal "Washington", robot.state
    assert_equal "CP30", robot.avatar
    assert_equal "07/09/92", robot.birthday
    assert_equal "10/10/10", robot.date_hired
    assert_equal "VFX", robot.department
  end

  def test_it_finds_all_robots
    create_robots(2)

    assert_equal 2, RobotWorld.all.count
  end

  def test_it_finds_a_robot_by_id
    create_robots(2)

    robot = RobotWorld.find(RobotWorld.all.first.id)

    assert_equal "1 name", robot.name
  end

  def test_it_deletes_a_robot
    create_robots(3)
    total = RobotWorld.all.count

    RobotWorld.delete(RobotWorld.all.first.id)

    assert_equal (total - 1), RobotWorld.all.count
  end
end
