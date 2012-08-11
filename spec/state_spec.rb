require "spec_helper"

describe Base do

  it "should notify when new state is added" do
    state = InitialState.new do |s|
      s.on :new_state_added do |new_state|
        new_state.should == SecondaryState
      end
    end
    state.add_next_state(SecondaryState)
  end

end