module HttpState
  class StateMachine

    def initialize(options = {})
      @state_queue = options[:state_queue]
      @state_factory = options[:state_factory]
      @current_state = create_state(options[:initial_state])
      @next_state = nil
    end

    def start
      handle_current_state
    end

    def current_state
      @current_state.class
    end

    def handle_current_state
      attach_handlers_to_state(@current_state)
      @current_state.handle
      @current_state.cleanup
      handle_next_item unless @state_queue.empty?
      @current_state = create_state(@next_state) unless @next_state.nil?
    end

    private

    def attach_handlers_to_state(state)
      state.on :new_state_added do |new_state, parameters|
        @state_queue.push(new_state, parameters)
      end
      state.on :next_state_saved do |state_class|
        @next_state = state_class
      end
    end

    def handle_next_item
      next_item = @state_queue.pop
      handle_state(next_item.state_class)
    end

    def handle_state(state_class)
      @current_state = create_state(state_class)
      handle_current_state
    end

    def create_state(state_class)
      @state_factory.create_state(state_class)
    end


  end
end