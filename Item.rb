class Item
  attr_reader :name, :price, :body_part
  attr_accessor :quantity
  def initialize(name, price, body_part, quantity)
    @name = name
    @price = price
    @body_part = body_part
    @quantity = quantity
  end
end
