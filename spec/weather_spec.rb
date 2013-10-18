require 'weather'

describe Weather do
  it 'is sunny' do
  weather = Weather.new
  weather.good_weather
  expect(weather).to be_sunny
  end

  it 'is stormy' do
  	weather = Weather.new
  	weather.bad_weather
  	expect(weather).not_to be_sunny
  end

  

end
