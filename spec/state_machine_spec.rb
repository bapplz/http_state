require "spec_helper"

class InitialState
end

describe StateMachine do

  let(:state_machine) { StateMachine.new initial_state: InitialState }

  it "should have correct initial state" do
    state_machine.current_state.should == InitialState
  end

end