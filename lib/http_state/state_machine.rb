module HttpState
  class StateMachine

    attr_reader :current_state

    def initialize(options = {})
      @current_state = options[:initial_state]
    end
  end
end