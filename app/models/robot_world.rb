class RobotWorld
  def self.database
    if ENV["RACK_ENV"] == "test"
      @database ||= Sequel.sqlite("db/robot_world_test.sqlite3")
    else
      @database ||= Sequel.sqlite("db/robot_world_development.sqlite3")
    end
  end

  def self.create(robot)
    dataset.insert( name: robot[:name],
                    city: robot[:city],
                    state: robot[:state],
                    avatar: robot[:avatar],
                    birthday: robot[:birthday],
                    date_hired: robot[:date_hired],
                    department: robot[:department]
                    )
  end

  def self.update(id, data)
    dataset.where(:id => id).update(name: robot[:name],
                                    city: robot[:city],
                                    state: robot[:state],
                                    avatar: robot[:avatar],
                                    birthday: robot[:birthday],
                                    date_hired: robot[:date_hired],
                                    department: robot[:department]
                                    )
  end

  def self.delete(id)
    dataset.where(:id => id).delete
  end

  def self.raw_robots
    database.transaction do
      database['robots'] || []
    end
  end

  def self.all
    robots = dataset.to_a
    robots.map { |data| Robot.new(data) }
  end

  def self.raw_robot(id)
    raw_robots.find { |robot| robot["id"] == id }
  end

  def self.find(id)
    Robot.new(dataset.where(:id => id).to_a.first)
  end

  def self.dataset
    database.from(:tasks)
  end
end
