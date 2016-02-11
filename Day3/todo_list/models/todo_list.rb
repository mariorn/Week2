require 'yaml/store'
require 'yaml'
require './models/task.rb'
require './models/manage_data.rb'

class TodoList
  include ManageData

  attr_accessor :tasks, :todo_store
  def initialize name
    @todo_store = YAML::Store.new("./public/tasks.yml")
    @tasks = []
    @user = name
  end

  def add_task task
    @tasks << task
  end

  def delete_task id_task
    @tasks.delete_if{|task| task.id == id_task}
  end

  def find_task_by_id task_id
    @tasks.find_all{|task| task.id == task_id}[0]
  end

  def sort 
    @tasks.sort{ | task1, task2 | task1.id <=> task2.id }
  end

  def sort_by_created(option = "ASC")
    if option == "ASC"
      @tasks.sort{ | task1, task2 | task1.created_at <=> task2.created_at }
    elsif option == "DESC"
      @tasks.sort{ | task1, task2 | task2.created_at <=> task1.created_at }
    end
  end

  def save
    @todo_store.transaction do 
        @todo_store[@user] = @tasks
    end
  end

  def load_tasks

    load_list = YAML.load_file("./public/tasks.yml")

    load_list.each do |key, value|
      @user = key

      value.each do |task| 
        @tasks << task
      end
    end

  end

end







# todo_list.load_tasks
# puts todo_list.tasks.length











