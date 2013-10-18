class Weather

  def initialize 
	  @sunny = true
  end

	def sunny? 
	  @sunny
	end

	def good_weather
	  @sunny = true
	end

	def bad_weather
	  @sunny = false 
	end

	def random_weather_generator
	  weather_generator = rand(1..3)
	  @sunny = true if weather_generator < 2
	  @sunny = false if weather_generator > 2
	  nil
	end 

end


