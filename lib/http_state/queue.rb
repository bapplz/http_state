module HttpState
  class Queue

    def initialize
      @states = []
    end

    def push(state_class, parameters = {})
      item = Item.new()
      item.state_class = state_class
      item.parameters = parameters
      @states << item
    end

    def pop
      if empty?
        raise "Popping from empty state queue is not allowed"
      end
      result = @states.first
      @states.delete_at 0
      result
    end

    def empty?
      @states.empty?
    end
  end

  class Item
    attr_accessor :state_class
    attr_accessor :parameters
  end
end
