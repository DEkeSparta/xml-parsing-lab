require 'nokogiri'

class GuiseppesMenu

  attr_accessor :menu

  def initialize
    @menu = Nokogiri::XML(File.open('./xml_menu.xml'))
  end

  # Place your methods here

  def get_prices
    price_items = @menu.xpath("//price")
    prices = []
    price_items.each do |p|
      prices.push p.text[1..-1].to_f
    end

    return prices
  end

  def get_foods
    return @menu.xpath("//food")
  end

  def get_food_name food
    return food.xpath("name").text
  end

  def get_food_calories food
    return food.xpath("calories").text.to_f
  end

  def are_calories_below_except? amount, exception
    get_foods.each do |food|
      if get_food_name(food).downcase != exception.downcase
        if get_food_calories(food) > amount
          return false
        end
      end
    end
    return true
  end

end

xml = GuiseppesMenu.new
foods = xml.get_foods

puts xml.get_food_name(foods.first)
puts xml.get_food_calories(foods.first)
