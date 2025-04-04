class Character
  attr_accessor :name, :power, :agility, :intelligence, :inventory, :equipped_items, :money
  def initialize(name, power, agility, intelligence)
    @name = name
    @power = power
    @agility = agility
    @intelligence = intelligence
    @inventory = []
    @money = 50
    @equipped_items = {
      "head" => nil,
      "body" => nil,
      "feet" => nil,
      "weapon1" => nil,
      "weapon2" => nil,
      "bag1" => [],
      "bag2" => []
    }
  end
end