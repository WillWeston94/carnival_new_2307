require './lib/visitor'
require './lib/ride'
require './lib/carnival'
require 'pry'

RSpec.describe Carnival do
  before(:each) do
    @carnival = Carnival.new(14)
    @ride2 = Ride.new({ name: 'Ferris Wheel', min_height: 36, admission_fee: 5, excitement: :gentle })
    @ride3 = Ride.new({ name: 'Roller Coaster', min_height: 54, admission_fee: 2, excitement: :thrilling })
  end

  it 'carnival exists with duration attribute' do
    expect(@carnival).to be_an_instance_of(Carnival)
  end

  it 'carnival can add rides' do
    @carnival.add_ride(@ride2)
    @carnival.add_ride(@ride3)

    expected_array = 
    [
      @ride2,
      @ride3
    ]
    expect(@carnival.rides).to be_an Array
    expect(@carnival.rides).to eq(expected_array)
  end
end