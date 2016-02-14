require 'sinatra'
require 'sinatra/reloader'
require './lib/movie.rb'
require './lib/quiz.rb'
require 'pry'


use Rack::Session::Pool

@quiz = []

get "/" do
  erb(:index)
end

post "/new_quiz" do 
  
  word = params[:word]
  @quiz = Quiz.new(word.downcase)
  
  if @quiz.check_number_of_movies
    @quiz.get_movies
  else
    erb(:wrong_word)
  end
  
  @movies = @quiz.movies
  @questions = @quiz.get_questions
  session[:movies] = @movies
  session[:questions] = @questions
  redirect to "/new_question"
end

get "/new_question" do
  @movies = session[:movies]
  @random_number = rand(1..9)
  @random_question = rand(0..2)
  @questions = session[:questions]
  @question = @questions[@random_number][@random_question]
  erb(:show_quiz)
end

get "/try_again" do
  redirect("/")
end

