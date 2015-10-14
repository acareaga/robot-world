class Robot
  attr_reader :name,
              :city,
              :state,
              :birthday,
              :hire_date,
              :department,
              :id

  def initialize(data)
    @id         = data["id"]
    @name       = data["name"]
    @city       = data["city"]
    @state      = data["state"]
    @birthday   = date["birthday"]

    @department = data["department"]

  end
end
