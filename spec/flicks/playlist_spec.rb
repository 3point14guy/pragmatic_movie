require 'flicks/playlist'
# require_relative 'playlist'
# before arranging into a gem file structure, use sytax of line 2
# rspec already has lib and bin directories in it's load path

module Flicks
  describe Playlist do
    before  do
      @playlist = Playlist.new("Kermit")
    end

    context "being played with one movie" do
      before do
        @initial_rank = 10
        @movie = Movie.new("goonies", @initial_rank)
        @playlist.add_movie(@movie)
      end

      it "gives a movie a thumbup if a high number is rolled" do
        Reviewer.stub(:roll_die).and_return(5)
        @playlist.play(1)
        expect(@movie.rank).to eq(@initial_rank + 1)
      end

      it "skips the movie if a medium number is rolled" do
        Reviewer.stub(:roll_die).and_return(3)
        @playlist.play(1)
        expect(@movie.rank).to eq(@initial_rank)
      end

      it "it gives the movie a thumbs down if a low number is rolled" do
        Reviewer.stub(:roll_die).and_return(1)
        @playlist.play(1)
        expect(@movie.rank).to eq(@initial_rank-1)
      end
    end
  end
end
