require 'yaml/store'
require './task.rb'

class TodoList
  attr_reader :tasks
  def initialize name
    @todo_store = YAML::Store.new("./public/tasks.yml")
    @tasks = []
    @name = name
  end

  def add_task task
    @tasks << task
  end

  def delete_task id_task
    @tasks.delete_if{|task| task.id == id_task}
  end

  def find_task_by_id task_id
    @tasks.select {|task| task.id == task_id}
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

end
















