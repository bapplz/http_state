module HttpState

  class Base
    def initialize(state_queue)
      @state_queue = state_queue
      @next_state = self.class
    end

    def add_next_state(state_class, parameters = {})
      @state_queue.push(state_class, parameters)
    end

    def next
      @next_state
    end
  end

end
