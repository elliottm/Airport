require 'airport' 

describe Airport do

let(:airport) { Airport.new }
let(:plane) { double :plane }
let(:weather) {double :weather, :random_weather_generator => true}

  it 'can accept a plane' do
    expect(airport.plane_count).to eq 0
    airport.dock(plane)
    expect(airport.plane_count).to eq 1
  end

  it 'can release a plane' do
    airport.dock(plane)
    expect(airport.plane_count).to eq 1
    airport.release_plane
    expect(airport.plane_count).to eq 0
  end

  it 'knows when the aiport is full' do
    10.times { airport.dock(plane) }
    expect(airport).to be_full
  end

  it 'knows when airport is not full' do
    9.times { airport.dock(plane)}
    expect(airport).not_to be_full
  end

  it 'does not let you dock a plane if the airport is full' do
    10.times { airport.dock(plane)}
    expect(lambda { airport.dock(plane) }).to raise_error(RuntimeError)
  end
  
  it 'knows how many spaces are available at airport' do
    airport = Airport.new Array.new(5, plane)
    expect(airport.slots_available).to eq 5
  end

  it 'knows that it is sunny' do
    expect(weather).to receive(:random_weather_generator).and_return true
    airport.operational?(weather)
  end

  it 'knows that it is operational' do
    airport.operational?(weather)
    expect(airport).to be_operational(weather)
  end

  it 'knows that it is not sunny' do
    weather = double :weather, {:random_weather_generator => false}
    expect(weather).to receive(:random_weather_generator).and_return false
    airport.operational?(weather)
  end

   it 'knows that it is not operational' do
    weather = double :weather, {:random_weather_generator => false}
    airport.operational?(weather)
    expect(airport).not_to be_operational(weather)
  end

  it 'does not allow landing if not operational' do
    airport.not_operational
    expect(lambda { airport.dock(plane)}).to raise_error(RuntimeError)
  end

end
