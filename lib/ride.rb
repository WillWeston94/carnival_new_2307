class Ride
  attr_reader :name, :min_height, :admission_fee, :excitement, :total_revenue, :rider_log
    def initialize(attributes)
      @name = attributes[:name]
      @min_height = attributes[:min_height]
      @admission_fee = attributes[:admission_fee]
      @excitement = attributes[:excitement]
      @rider_log = Hash.new(0) # set for default 0
    end

    def total_revenue
      # pass for now until log with keys and values for amount of times they rode
      @rider_log.keys.sum do |visitor|
        @rider_log[visitor] * admission_fee
      end
    end

    def board_rider(visitor)
      if visitor.height >= min_height && visitor.matching_preference?(excitement) && visitor.spending_money >= admission_fee
        visitor.money_spent(admission_fee)
        @rider_log[visitor] += 1
      end
    end
  end