module HttpState

  class Factory
    def deep_const_get(str)
      str.split('::').inject(Object) {|a,b| a.const_get(b) }
    end

    def create_state(state)
      state_object = deep_const_get(state)
      state_object.new
    end
  end
end