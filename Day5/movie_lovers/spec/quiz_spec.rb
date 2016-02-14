require './lib/movie.rb'
require './lib/quiz.rb'
require 'rspec'

RSpec.describe "Units tests for the Quiz class" do

  let(:quiz){Quiz.new("iron")}

  before(:each) do
    movie1 = Post.new("Title", "15 Dic 1976", "Mariodovar", "Juanita bam bam", "", "", "http://ia.media-imdb.com/images/M/MV5BMTQ1NDg4NjUyM15BMl5BanBnXkFtZTgwMTQ1NTM1NzE@.jpg" )
    quiz.add_movie(movie1)
  end

  describe "#check_number_of_movies" do 
    it "returns true if the number of movies is 9 or more" do 
      expect(quiz.check_number_of_movies).to eq(true)
    end
  end



end
