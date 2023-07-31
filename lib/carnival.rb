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

  ride object
  def most_profitable_ride
  end

  # integer
  # def total_revenue
  # end
end