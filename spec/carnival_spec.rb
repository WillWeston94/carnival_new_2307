require './lib/visitor'
require './lib/ride'
require './lib/carnival'
require 'pry'

RSpec.describe Carnival do
  before(:each) do
    @carnival = Carnival.new("14 days of fun!")
    @ride1 = Ride.new({ name: 'Carousel', min_height: 24, admission_fee: 1, excitement: :gentle })
    @ride3 = Ride.new({ name: 'Roller Coaster', min_height: 54, admission_fee: 2, excitement: :thrilling })
    @visitor1 = Visitor.new('Bruce', 54, '$10')  
    @visitor2 = Visitor.new('Tucker', 36, '$5')
    @visitor3 = Visitor.new('Penny', 64, '$15')
    @visitor4 = Visitor.new('Jim', 72, '$20')
  end

  it 'carnival exists with duration and rides attributes' do
    expect(@carnival).to be_an_instance_of(Carnival)
    expect(@carnival.duration).to eq(14)
    expect(@carnival.rides).to eq([])
  end

  it 'carnival can add rides' do
    @carnival.add_ride(@ride1)
    @carnival.add_ride(@ride3)

    expect(@carnival.rides).to be_an Array
    expect(@carnival.rides).to eq([@ride1, @ride3])
  end

  it 'checks most popular ride at the carnival' do
    @carnival.add_ride(@ride1)
    @carnival.add_ride(@ride3)

    @visitor1.add_preference(:gentle)
    @visitor2.add_preference(:gentle)
    @visitor2.add_preference(:thrilling) #change from gentle to thrilling for ride3 coaster
    @visitor3.add_preference(:thrilling)
    @visitor4.add_preference(:thrilling)

    @ride1.board_rider(@visitor1)
    @ride1.board_rider(@visitor2)
    @ride1.board_rider(@visitor1)
    @ride3.board_rider(@visitor1)
    @ride3.board_rider(@visitor2)
    @ride3.board_rider(@visitor1)
    @ride3.board_rider(@visitor3)
    @ride3.board_rider(@visitor3)
    @ride3.board_rider(@visitor4)
    @ride3.board_rider(@visitor4)

    expected_hash = 
    {
    @visitor3 => 2,
    @visitor4 => 2,
    }
    # binding.pry

    expect(@ride3.rider_log).to eq(expected_hash)
    expect(@carnival.most_popular_ride).to eq(@ride3)
  end

  it 'checks most profitable ride at the carnival' do
    @carnival.add_ride(@ride1)
    @carnival.add_ride(@ride3)

    @visitor1.add_preference(:gentle)
    @visitor2.add_preference(:gentle)
    @visitor2.add_preference(:thrilling) #change from gentle to thrilling for ride3 coaster
    @visitor3.add_preference(:thrilling)
    @visitor4.add_preference(:thrilling)

    @ride1.board_rider(@visitor1)
    @ride1.board_rider(@visitor2)
    @ride1.board_rider(@visitor1)
    @ride3.board_rider(@visitor1)
    @ride3.board_rider(@visitor2)
    @ride3.board_rider(@visitor1)
    @ride3.board_rider(@visitor3)
    @ride3.board_rider(@visitor3)
    @ride3.board_rider(@visitor4)
    @ride3.board_rider(@visitor4)

    # expected_hash = 
    # {
    # @visitor3 => 2,
    # @visitor4 => 2,
    # }

    # binding.pry
    expect(@carnival.most_profitable_ride).to eq(@ride3)
  end

  it 'checks total_revenue at the carnival' do
    @carnival.add_ride(@ride1)
    @carnival.add_ride(@ride3)

    @visitor1.add_preference(:gentle)
    @visitor2.add_preference(:gentle)
    @visitor2.add_preference(:thrilling) #change from gentle to thrilling for ride3 coaster
    @visitor3.add_preference(:thrilling)
    @visitor4.add_preference(:thrilling)

    @ride1.board_rider(@visitor1)
    @ride1.board_rider(@visitor2)
    @ride1.board_rider(@visitor1)
    @ride3.board_rider(@visitor1)
    @ride3.board_rider(@visitor2)
    @ride3.board_rider(@visitor1)
    @ride3.board_rider(@visitor3)
    @ride3.board_rider(@visitor3)
    @ride3.board_rider(@visitor4)
    @ride3.board_rider(@visitor4)

    # binding.pry
    expect(@carnival.total_revenue).to eq(11)
  end

  it 'provides summary hash for visitor count' do
    @carnival.add_ride(@ride1)
    @carnival.add_ride(@ride3)

    @visitor1.add_preference(:gentle)
    @visitor2.add_preference(:gentle)
    @visitor2.add_preference(:thrilling) #change from gentle to thrilling for ride3 coaster
    @visitor3.add_preference(:thrilling)
    @visitor4.add_preference(:thrilling)

    @ride1.board_rider(@visitor1)
    @ride1.board_rider(@visitor2)
    @ride1.board_rider(@visitor1)
    @ride3.board_rider(@visitor1)
    @ride3.board_rider(@visitor2)
    @ride3.board_rider(@visitor1)
    @ride3.board_rider(@visitor3)
    @ride3.board_rider(@visitor3)
    @ride3.board_rider(@visitor4)
    @ride3.board_rider(@visitor4)

    expected_hash = 
    {
      visitor_count: 4 , 
      revenue_earned: 11
    }

    expect(@carnival.summary).to eq(expected_hash)
  end
end