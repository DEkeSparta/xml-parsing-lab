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

end

xml = GuiseppesMenu.new
puts xml.get_foods
