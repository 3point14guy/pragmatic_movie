require_relative "movie"

# "<" shows inheritance
class Movie3d < Movie

  # "super" allows us to acces the initalize method in the parent classes
  # in this case, it allows us to define title and rank attributes as well as wow_factor when we create a new instance of a 3d movie
  def initialize(title, rank, wow_factor)
    super(title, rank)
    @wow_factor = wow_factor
  end
# new method not available to ancestors or super class
  def show_effect
    puts "Wow!" * @wow_factor
  end

# method over-riding any methods in parents, ancestors, superclasses
# child classes have access to the instance variables of their parent classes
  def thumbs_up
    @rank += (1 * @wow_factor)
  end

# alternative:
# use to super to call the existing thumbs_up method in the parent class (which already increments the rank by 1) and combine it with a .times loop on @wow_factor
  def thumbs_up
    @wow_factor.times { super }
  end

end
