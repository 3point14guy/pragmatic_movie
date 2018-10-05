# class Snack
#   attr_reader :name, :carbs
#
#   def initialize(name, carbs)
#     @name, @carbs = name, carbs
#   end
# end
#instead of above
Snack = Struct.new(:name, :carbs)

module SnackBar

  SNACKS = [
    Snack.new(:popcorn, 20),
    Snack.new(:candy, 15),
    Snack.new(:nachos, 40),
    Snack.new(:soda, 5),
    Snack.new(:pretzel, 25),
  ]

  def self.random
    SNACKS.sample
  end
end

if __FILE__ == $0
# double colon is a scope resolution operator
  puts SnackBar::SNACKS
  puts SnackBar.random
end
