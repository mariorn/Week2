require_relative '../server.rb'
require 'rspec'
require 'rack/test'

describe 'Server Service' do
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end 

  it "shows all the tasks" do
    get '/'
    expect(last_request.path).to eq('/')
  end

  it "shows form to add a new task" do
    get '/new_task'
    expect(last_response).to be_ok 
  end

  it "save the new task" do
    get '/create_task'
    expect(last_request.path).to eq('/create_task')
    expect(last_response.redirect?).to_not be(true)
  end

  it "complete the selected task" do
    get '/complete/*'
    
    expect(last_response.redirect?).to_not be(true)
  end

end

