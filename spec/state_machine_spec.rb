require "spec_helper"

describe StateMachine do

  let(:state_machine) { StateMachine.new initial_state: InitialState, state_queue: Queue.new, state_factory: Factory.new }

  it "should have correct initial state" do
    state_machine.current_state.should == InitialState
  end

  it "should have next saved state" do
    state_machine.start
    state_machine.current_state.should == InitialState
  end

end