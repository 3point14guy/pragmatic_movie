
# file = File.open("movies.csv")
# # read file here
# # then you should close the File
# file.close

# so you dont have to remember to close the file:
# File.open("movies.csv") do |file|
#   #read file here
#   #.each_line will iterate over all lines in the file
#   file.each_line do |line|
#     puts line
#   end
# end
# # even easier is this. "readlines" will create an array we can iterate over with ".each"
# File.readlines("movies.csv").each do |file|
#   puts line
# end

require_relative "movie"

# File.readlines("movies.csv").each do |line|
#   title, rank = line.split(",")
#   movie = Movie.new(title, rank.to_i)
#   puts movie
# end


# writing to a file
movie1 = Movie.new("goonies", 10)
movie2 = Movie.new("ghostbusters", 9)
movie3 = Movie.new("goldfinger", 0)

movies = [movie1, movie2, movie3]

# going to pass a "mode" for this file "w" is for write so we can write info into the file
File.open("movie_rankings.csv", "w") do |file|
  movies.sort.each do |movie|
    file.puts "#{movie.title},#{movie.rank}"
  end
end
