require 'yaml/store'

class Task
  attr_reader :content, :id, :complete, :current_id, :created_at
  @@current_id = 1
  def initialize(content)
      @content = content
      @id = @@current_id
      @@current_id += 1
      @complete = false
      @created_at = Time.now
      @updated_at = nil
  end

  def complete?
    complete
  end

  def complete!
    @complete = true
  end

  def make_incomplete!
    @complete = false
  end

  def update_content! new_content
    @updated_at = Time.now
    @content = new_content
  end

end

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
















