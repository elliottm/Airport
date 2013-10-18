require 'weather'

describe Weather do

let(:weather) { Weather.new }

  it 'is sunny' do
    weather.good_weather
    expect(weather).to be_sunny
  end

  it 'is stormy' do
  	weather.bad_weather
  	expect(weather).not_to be_sunny
  end

  it 'generates a random weather pattern' do
  	weather.random_weather_generator
  	expect(weather.sunny?).to (be_true) || (be_false)
  end

end
