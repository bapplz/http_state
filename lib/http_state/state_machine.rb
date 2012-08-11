module HttpState
  class StateMachine

    def initialize(options = {})
      @current_state = options[:initial_state]
      @state_queue = options[:state_queue]
      @state_factory = options[:state_factory]
      @current_state.on :new_state_added do |new_state, parameters|
        @state_queue.push(new_state, parameters)
      end
    end

    def start
      handle_current_state
    end

    def current_state
      @current_state.class
    end

    private

    def handle_current_state
      @current_state.handle
      next_item = @state_queue.pop
      @current_state = @state_factory.create_state(next_item.state_class.to_s)
    end
  end
end