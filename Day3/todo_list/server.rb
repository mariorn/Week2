require "sinatra"
require 'sinatra/reloader'
require './models/task.rb'
require './models/todo_list.rb'

enable(:sessions)

todo_list = TodoList.new("Josh")
#todo_list.load_tasks


get "/" do
  @tasks = todo_list.tasks
  erb(:task_index)
end

get "/new_task" do 
  erb(:new_task)
end

post "/create_task" do 
  task = Task.new(params["content"])
  todo_list.add_task(task)
  todo_list.save

  redirect("/")
end

get "/complete/:id" do
  (todo_list.find_task_by_id(params[:id].to_i)).complete!
  todo_list.save

  redirect("/")
end

get "/delete/:id" do
  todo_list.delete_task(params[:id].to_i)
  todo_list.save

  redirect("/")
end
