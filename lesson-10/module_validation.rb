module Validation
  def self.included(base)
    base.extend ClassMethods
    base.send  :include, InstanceMethods
  end


  module InstanceMethods
    def validate!
      presence if self.respond_to?(:presence_respond)
      format if self.respond_to?(:format_respond)
      type if self.respond_to?(:type_respond)
      true
    rescue => e
      return e.inspect
    end

    def validate?
      #здесь у меня в случае оишбки все нормально- возвращается false
      #но в случае прохождения валидации возвращется true + сообщение
      #это конечно тупо, но я не смог сделать просто возврат true
      if validate! == true
        true
      else
        false
      end
    end

    def presence
      if self.presence_respond.nil? || self.presence_respond.to_s.empty?
        raise "Presence validation failed"
      else
        puts "Presence validation succesfull"
      end
    end

    def format
      if format_respond
        raise "Format validation failed"
      else
        puts "Format validation succesfull"
      end
    end

  def type
    if type_respond
      puts "Type validation succesfull"
    else
      raise "Type validation failed"
    end
  end
end

  module ClassMethods
    def validate(attr_name, validation_type, *params)
      var = "@#{attr_name}".to_sym
      if validation_type == :presence
        define_method(:presence_respond) { instance_variable_get(var) }
      end

      if validation_type == :format
        define_method(:format_respond) {instance_variable_get(var) !~ params[0]}
      end

      if validation_type == :type
        define_method(:type_respond) {instance_variable_get(var).class == params[0]}
      end
    end
  end

end

class Test
  include Validation
  def initialize(name)
    @name = name
  end
  validate :name, :presence
end
