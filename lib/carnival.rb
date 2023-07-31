class Carnival
attr_reader :duration, :rides

  def initialize(duration)
    @duration = duration.to_i
    @rides = []
  end

  def add_ride(ride)
    @rides << ride
  end

  # ride object
  def most_popular_ride
    most_popular_ride = @rides.max_by do |ride|
    ride.rider_log.values.sum
    end
    most_popular_ride
  end

  # ride object
  def most_profitable_ride
    most_profitable_ride = @rides.max_by do |ride|
      ride.total_revenue
    end
    most_profitable_ride
  end

  # integer
  def total_revenue
    total_revenue = @rides.sum do |ride|
      ride.total_revenue
    end
    total_revenue
  end

  # hash
  def summary
    {
      visitor_count: @rides.map do |ride|
        ride.rider_log.keys.count
      end.sum,
      
      revenue_earned:total_revenue
    }
  end
end