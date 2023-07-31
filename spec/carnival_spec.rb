require './lib/visitor'
require './lib/ride'
require './lib/carnival'
require 'pry'

RSpec.describe Carnival do
  before(:each) do
    @carnival = Carnival.new("14 days of fun!")
    @ride2 = Ride.new({ name: 'Ferris Wheel', min_height: 36, admission_fee: 5, excitement: :gentle })
    @ride3 = Ride.new({ name: 'Roller Coaster', min_height: 54, admission_fee: 2, excitement: :thrilling })
    @visitor1 = Visitor.new('Bruce', 54, '$10')  
    @visitor2 = Visitor.new('Tucker', 36, '$5')
    @visitor3 = Visitor.new('Penny', 64, '$15')
  end

  it 'carnival exists with duration and rides attributes' do
    expect(@carnival).to be_an_instance_of(Carnival)
    expect(@carnival.duration).to eq(14)
    expect(@carnival.rides).to eq([])
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