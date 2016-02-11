module ManageData
  def save
    @todo_store.transaction do
      @todo_store[@user] = @tasks
    end
  end
  def load_tasks
    @tasks = YAML.load_file("../public/tasks.yml")
  end  
end