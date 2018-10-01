class Movie
  attr_accessor :title
  attr_reader :rank

  def initialize(title, rank)
    @title = title.capitalize
    @rank = rank
  end

  def normalized_rank
    @rank / 10
  end

  def to_s
    "#{@title} has a rank of #{@rank}"
  end

  def thumbs_up
    @rank = @rank + 1
  end

  def thumbs_down
    @rank -= 1
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
