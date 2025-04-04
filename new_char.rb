require_relative 'Character'
require_relative 'Item'

puts "Hi, let's create a new character!"
puts "What is your character's name?"
name = gets.chomp.capitalize
puts "Ok let's generate your stats!"
power = rand(8..20)
agility = rand(8..20)
intelligence = rand(8..20)

main_character = Character.new(name, power, agility, intelligence)
puts "Your character has been created!"
puts "Name: #{main_character.name}"
puts "Power: #{main_character.power}"
puts "Agility: #{main_character.agility}"
puts "Intelligence: #{main_character.intelligence}"

puts "Now let's go shopping!"
puts "You have #{main_character.money} coins."
puts "What would you like to buy?"

selling = [
  sword = Item.new("Sword", 15, "weapon1", rand(1..3)),
  shield = Item.new("Shield", 11, "weapon2", rand(1..2)),
  helmet = Item.new("Helmet", 6, "head", rand(1..3)),
  hatchet = Item.new("Hatchet", 10, "weapon1", rand(1..2)),
  leather_armor = Item.new("Leather Armor", 13, "body", rand(1..4)),
  studded_leather_armor = Item.new("Studded Leather Armor", 18, "body", rand(1..2)),
  stiff_boots = Item.new("Stiff Boots", 9, "feet", rand(1..3)),
  hide_boots = Item.new("Hide Boots", 12, "feet", rand(1..2)),
  mace = Item.new("Mace", 11, "weapon1", rand(1..2)),
  dagger = Item.new("Dagger", 8, "weapon2", rand(1..3)),
  chain_mail = Item.new("Chain Mail", 21, "body", rand(1..2))
]

def shopping(selling, character)
  puts "Welcome! You have #{character.money} coins."
  puts "What will you buy?"

  # Display the items for sale
  selling.each_with_index do |item, index|
    puts "#{index + 1}. #{item.name} - #{item.price} coins (quantity: #{item.quantity})"
  end

  # Prompt for user input
  puts "Please type the number of the item you want to buy, or type 'exit' to leave the shop."
  choice = gets.chomp.downcase
  puts "DEBUG: You entered '#{choice}'" # Debugging output

  # Exit if the user types 'exit'
  return if choice == 'exit'

  # Validate the choice
  if choice.to_i.between?(1, selling.size)
    item = selling[choice.to_i - 1]
    puts "DEBUG: Selected item is #{item.name} (quantity: #{item.quantity}, price: #{item.price})" # Debugging output

    # Check if the user can afford the item and if it's in stock
    if character.money >= item.price && item.quantity > 0
      character.money -= item.price
      item.quantity -= 1
      character.inventory << item
      puts "You bought a #{item.name} for #{item.price} coins."
      puts "You have #{character.money} coins left. Remaining quantity of #{item.name}: #{item.quantity}"
    else
      puts "You can't afford that or it's out of stock."
    end
  else
    puts "Invalid choice. Please try again."
  end

  # Recursively call the shopping method to allow multiple purchases
  shopping(selling, character)
end

shopping(selling, main_character)