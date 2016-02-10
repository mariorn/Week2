require 'sinatra'
require 'pry'
require_relative './password.rb'

get "/" do  
  "<h1>Password Checker</h1>"
  erb(:index)
end

post "/check" do
  if PasswordChecker.new.check_password(params[:email], params[:password]) 
    @result = "Correct pass"   
  else
    @result = "Incorrect pass. Try again."   
  end
  erb(:result)
end

