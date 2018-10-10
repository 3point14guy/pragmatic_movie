class Movie
  attr_accessor :title
  attr_reader :rank

  def initialize(title, rank = 0)
    @title = title.capitalize
    @rank = rank
    @snack_carbs = Hash.new(0)
  end

  # clean up from original playlist.rb code for saving to a csv
  def to_csv
    "#{@title},#{@rank}"
  end

  # clean up from original playlist.rb code for creating a movie from a csv
  def self.from_csv(line)
    title, rank = line.split(",")
    # Movie.new(title, rank.to_i)
    # forming an integer this way will throw an exception if rank cannot be converted
    Movie.new(title, Integer(rank))
  end

  def ate_snack(snack)
    @snack_carbs[snack.name] += snack.carbs
    puts "#{@title} led to #{snack.carbs} #{snack.name} carbs being consumed."
    puts "#{@title}'s snacks: #{@snack_carbs}"
  end

  def each_snack
    @snack_carbs.each do |name, carbs|
      snack = Snack.new(name, carbs)
      yield snack
    end
  end

  def carbs_consumed
    @snack_carbs.values.reduce(0, :+)
  end

  def <=>(other_movie)
    other_movie.rank <=> @rank
  end

  def normalized_rank
    @rank / 10
  end

  def to_s
    "#{@title} has a rank of #{@rank} (#{status})"
  end

  def thumbs_up
    @rank = @rank + 1
  end

  def thumbs_down
    @rank -= 1
  end

  def hit?
    @rank >= 10
  end

  def status
    hit? ? "Hit" : "Flop"
  end
end

# this if statement checks to see __FILE__ (the current file name) equates to $0 (the currently running program)
# this code will only be run when this movie.rb file is being executed and not when any of movie.rb's dependencies are executed
if __FILE__ == $0
  movie = Movie.new("goonies", 10)
  puts movie.title
  puts movie.rank

  movie.thumbs_up
  movie.thumbs_up
  puts movie.rank

  movie.thumbs_down
  puts movie.rank
  puts movie

end
