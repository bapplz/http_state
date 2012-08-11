module HttpState
  class Base
    def initialize
      @actions = {}
      yield self if block_given?
    end

    def on(action, &block)
      @actions[action] = [] unless @actions.has_key?(action)
      @actions[action] << block
    end

    def add_next_state(state_class, parameters = {})
      @actions[:new_state_added].each do |action|
        action.call(state_class, parameters)
      end
    end

    def save_next_state(state_class)
      @actions[:next_state_saved].each do |action|
        action.call(state_class)
      end
    end

    def handle

    end

    def cleanup

    end
  end

end
