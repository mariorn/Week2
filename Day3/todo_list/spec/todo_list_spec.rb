require './models/todo_list.rb'
require 'rspec'


RSpec.describe "Units tests for the TodoList class" do 

  before :each do
    @list = TodoList.new("John")
    @task = Task.new("Buy the milk")
    @list.add_task(@task)
    @todo_list = TodoList.new("Josh")
    @task1 = Task.new("Walk the dog")
    @task2 = Task.new("Buy the milk")
    @todo_list.add_task(@task1)
    @todo_list.add_task(@task2)
  end


  describe "#add_task" do
    it "Add the task to the list" do
      list_size = @list.tasks.length
      expect(@list.tasks.last.content).to eq(@task.content)
    end
  end

  describe "#delete_task" do 
    it "Delete the task with the ID associate" do
      list_size = @list.tasks.length
      @list.delete_task(@task.id)
      expect(@list.tasks.length).to eq(list_size - 1)
    end
  end

  describe "#find_task_by_id" do
    it "Returns the only task with a specific ID" do
      res_task = @todo_list.find_task_by_id(@task1.id)
      expect(res_task.id).to eq(@task1.id)
    end
  end

  describe "#sort" do 
    it "Returns an array of tasks ordered by ID" do
      sorted_tasks = @todo_list.sort
      expect(sorted_tasks[0].id < sorted_tasks[1].id).to eq(true)
    end
  end

  describe "#sort_by_created" do 
    it "Returns an array of tasks ordered by created_at time ascending" do
      sorted_tasks = @todo_list.sort_by_created
      expect(sorted_tasks[0].created_at < sorted_tasks[1].created_at).to eq(true)
    end
    it "Returns an array of tasks ordered by created_at time descending" do
      sorted_tasks = @todo_list.sort_by_created("DESC")
      expect(sorted_tasks[1].created_at < sorted_tasks[0].created_at).to eq(true)
    end
  end

  describe "#save" do
    it "saving the tasks to a file called tasks.yml" do
      task3 = Task.new("Make my todo list into a web app")
      @todo_list.add_task(task3)
      @todo_list.save
      expect(File.file?("./public/tasks.yml")).to eq(true)
    end
  end

  describe "#load_tasks" do
    it "load the tasks from a file called tasks.yml" do


      task3 = Task.new("Make my todo list into a web app")
      @todo_list.add_task(task3)
      @todo_list.save

      todo_list_mario = TodoList.new("Mario")
      todo_list_mario.load_tasks

      expect(todo_list_mario.tasks.length).to eq(3)
    end
  end

end





