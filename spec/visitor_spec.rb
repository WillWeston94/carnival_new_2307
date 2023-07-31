require './lib/visitor'
require 'pry'

RSpec.describe Visitor do
  before(:each) do
    @visitor1 = Visitor.new('Bruce', 54, '$10')  
  end

  it 'visitor exists with attributes' do
    expect(@visitor1).to be_a(Visitor)
    expect(@visitor1.name).to eq("Bruce")
    expect(@visitor1.height).to eq(54)
    expect(@visitor1.spending_money).to eq(10)
    expect(@visitor1.preferences).to eq([])
  end

  it 'can add preference' do
    @visitor1.add_preference(:gentle)
    @visitor1.add_preference(:thrilling)
    # binding.pry
    expect(@visitor1.preferences).to eq([:gentle, :thrilling])
  end
end