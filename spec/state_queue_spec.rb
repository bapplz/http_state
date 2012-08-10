require "spec_helper"

describe Queue do

  let(:queue) { Queue.new }

  it "should not be empty when an item is added" do
    queue.push 1
    queue.empty? {false}
  end

  it "should be empty when no item is left" do
    queue.push 1
    queue.pop
    queue.empty? {true}
  end

  it "should pop the pushed item as state class" do
    queue.push 1
    queue.pop.state_class.should == 1
  end
end