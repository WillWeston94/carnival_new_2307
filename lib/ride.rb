class Ride
  attr_reader :name, :min_height, :admission_fee, :excitement, :total_revenue
    def initialize(attributes)
      @name = attributes[:name]
      @min_height = attributes[:min_height]
      @admission_fee = attributes[:admission_fee]
      @excitement = attributes[:excitement]
      @rider_log = []
    end

    def total_revenue
      # pass for now until log with keys and values for amount of times they rode
      0
    end

    def board_rider(visitor)
    end

    #  create method to match preference 
    #  create helper to match visitor height >= min_height for ride
    #  spending money should -= amount for ride and amount of times ridden
  end