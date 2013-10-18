require 'plane'

describe Plane do

let(:plane) { Plane.new }
  it 'is not flying when created' do
    expect(plane).not_to be_flying
  end

  it 'can fly' do
    plane.take_off
    expect(plane).to be_flying
  end

  it 'can land' do
    plane.land
    expect(plane).not_to be_flying
  end

end
