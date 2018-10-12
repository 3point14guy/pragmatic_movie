require_relative 'movie'
require_relative 'playlist'
require_relative 'movie3d'
# could also just do require_relative 'playlist' as the playlist file already has a require_relative 'movie' in it


# movie1 = Movie.new("goonies", 10)
# movie2 = Movie.new("ghostbusters", 9)
# movie3 = Movie.new("goldfinger", 0)

playlist1 = Playlist.new("Kermit")
# playlist1.add_movie(movie1)
# playlist1.add_movie(movie2)
# playlist1.add_movie(movie3)

# ARGV = global varaible for command line arguements = we can pass a csv file name after calling the file to run. i.e. "ruby pragmatic_movie.rb superheros.csv"
# if no argument is passed, movies.csv will be used by default.
# calling .shift on ARGV will remove the first arguement from the ARGV array so that it wont get called and used again
playlist1.load(ARGV.shift || "movies.csv")
movie3d  = Movie3d.new('gone with the wind', 5, 20)
playlist1.add_movie(movie3d)

loop do
  puts "\nHow many viewings? (type 'quit' to exit)"
  answer = gets.chomp.downcase
  case answer
  when /^\d+$/
    puts "Enjoy your #{answer} viewings..."
    playlist1.play(answer.to_i)
  when "quit"
    playlist1.print_stats
    break
  else
    puts "Please enter a number or 'quit'"
  end
end

playlist1.save

# playlist2 = Playlist.new("Fozzie")
# playlist2.add_movie(movie3)
#
# movie4 = Movie.new("gremlins", 15)
# playlist2.add_movie(movie4)
# playlist2.play(1)
