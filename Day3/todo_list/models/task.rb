
class Task
  attr_accessor :complete
  attr_reader :content, :id, :current_id, :created_at
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