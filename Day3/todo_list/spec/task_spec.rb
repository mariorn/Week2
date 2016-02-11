require './models/task.rb'
require 'rspec'

RSpec.describe "Units tests for the Task class" do

  let(:task){Task.new("Buy the milk")}

  describe "#initialize" do 
    it "returns the content of the task" do 
      expect(task.content).to eq("Buy the milk")
    end

    it "all the tasks are incomplete initially" do 
      expect(task.complete).to eq(false)
    end
  end

  describe "#complete?" do
    it "returns if the task is complete or not" do
      expect(task.complete?).to eq(false)
    end
  end

  describe "#complete!" do
    it "complete the task" do
      expect(task.complete!).to eq(true)
    end
  end

  describe "#make_incomplete!" do
    it "incomplete the task" do
      expect(task.make_incomplete!).to eq(false)
    end
  end

  describe "#update_content!" do
    it "update the content of task" do
      expect(task.update_content!("Walk the dog")).to eq("Walk the dog")
    end
  end

end
