require 'imdb'
require './lib/movie.rb'

class Quiz
  attr_accessor :movies
  @@total_movies = 9
  @@questions_type = 3
  @@template_questions = {date: "Which movie was releases on a ",
                          director: "What movie was directed by ",
                          cast: "What movie was starring "}

	def initialize(word)
		@movies = []
    @search_term = word
    @imdb_films = Imdb::Search.new(word).movies
    @questions = {}
	end

	def add_movie(movie)
		@movies << movie
	end

  def get_movies

    cont = 0

    while(@movies.length < @@total_movies)
      if(@imdb_films[cont].poster != nil && 
         @imdb_films[cont].title.downcase.index(@search_term) != nil && 
         @imdb_films[cont].release_date != nil && 
         @imdb_films[cont].director != nil && 
         @imdb_films[cont].director.length > 0 &&
         @imdb_films[cont].cast_members != nil)

          movie = Movie.new(
                @imdb_films[cont].title, 
                @imdb_films[cont].release_date, 
                @imdb_films[cont].director[0], 
                @imdb_films[cont].cast_members[0], 
                @imdb_films[cont].poster
                )

          add_movie(movie)

        end
        cont += 1
    end
    @movies
  end

  def get_date(number)
    @movies[number].date
  end

  def get_questions

    @movies.each_with_index do |movie, i|
      questions_by_movie = []

      @@template_questions.each do |key, value| 
        questions_by_movie << "#{value} #{movie.keys_game[key]} ?"
      end

      @questions[i+1] = questions_by_movie
    end
    @questions
  end


  def check_number_of_movies
    @imdb_films.length > 9 ? true : false
  end

end




