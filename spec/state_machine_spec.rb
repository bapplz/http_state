require "spec_helper"

describe StateMachine do

  let(:initial_state) { InitialState.new }
  let(:state_machine) { StateMachine.new initial_state: initial_state, state_queue: Queue.new, state_factory: Factory.new }

  it "should have correct initial state" do
    state_machine.current_state.should == InitialState
  end

  it "should add state to the queue" do
    state_machine.start
    state_machine.current_state.should == SecondaryState
  end

end