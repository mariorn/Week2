require "sinatra"
require 'pry'
require "sinatra/reloader" if development?
require_relative './lib/Calculator.rb'

enable(:sessions)

get "/" do
  erb(:index)
end

get "/add" do 
  erb(:add)
end


post "/calculate" do

  calc = Calculator.new(params[:first_number].to_f, params[:second_number].to_f)

  operation = params["operation"]

  @cad = "#{calc.param1}"

  if operation == "addition" 
    @cad += " + #{calc.param2} = #{calc.get_add}" 
  elsif operation == "substract"
    @cad += " - #{calc.param2} = #{calc.get_sub}" 
  elsif operation == "multiply"
    @cad += " * #{calc.param2} = #{calc.get_mul}"
  elsif operation == "divide" 
    @cad += " / #{calc.param2} = #{calc.get_div}" 
  end

  session[:result_cad] = @cad

  erb(:result_operations)

end

get "/store" do

  f = File.new("./public/operations.txt", "a")
  f.write(session[:result_cad])
  f.close 
  redirect to("/")

end


