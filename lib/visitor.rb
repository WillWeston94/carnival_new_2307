class Visitor
attr_reader :name, :height, :spending_money, :preferences 
  def initialize(name, height, spending_money)
    @name = name
    @height = height
    @spending_money = spending_money_to_integer(spending_money)
    @preferences = []
  end

  def spending_money_to_integer(spending_money)
    spending_money.gsub("$", "").to_i
  end

  def add_preference(preference)
    @preferences << preference
  end

  def tall_enough?(required_height)
    if @height >= required_height
      true 
    else 
      false
    end
  end

  def matching_preference?(excitement)
    preferences.include?(excitement)
  end

  def money_spent(amount)
    @spending_money -= amount
  end
end