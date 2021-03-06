class Airport

  def initialize planes =[], capacity = 10, operational = true
    @planes = planes
    @capacity = capacity
    @operational = operational
  end

  def plane_count
    @planes.count
  end

  def dock plane
    raise "Airport is full mate" if full? 
    raise "Weather issues idiot" if not_operational
    @planes << plane
  end

  def release_plane
    @planes.pop
  end

  def full?
     plane_count == @capacity
  end

  def slots_available
    @capacity - plane_count
  end

  def operational? weather
    @operational = weather.random_weather_generator
  end

  def not_operational
    @operational = false
  end  

end
