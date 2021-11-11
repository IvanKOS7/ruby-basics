module InstanceCounter
  def self.included(base)
    base.extend ClassMethods
    base.send  :include, InstanceMethods
  end

  module InstanceMethods
    private
     def register_instance
       self.class.send :counter
     end
  end

  module ClassMethods
    attr_reader :counter

     def counter
       @counter ||= 0
       @counter += 1
     end

    def instances
      @counter ||= 0
    end
  end
end
