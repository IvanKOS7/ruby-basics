# frozen_string_literal: true

module Validation_1
  def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethods
  end

  module InstanceMethods
    def validate!
      presence if respond_to?(:presence_respond)
      format if respond_to?(:format_respond)
      type if respond_to?(:type_respond)
      true
    rescue StandardError => e
      e.inspect
    end

    def validate?
      validate! == true
    end

    def presence
      if presence_respond.nil? || presence_respond.to_s.empty?
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
      validations = []
      var = "@#{attr_name}".to_sym
      define_method(:presence_respond) { instance_variable_get(var) } if validation_type == :presence

      define_method(:format_respond) { instance_variable_get(var) !~ params[0] } if validation_type == :format

      define_method(:type_respond) { instance_variable_get(var).instance_of?(params[0]) } if validation_type == :type
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
