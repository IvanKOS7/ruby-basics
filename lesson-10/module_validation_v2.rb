# frozen_string_literal: true

module Validation

  def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethods
  end

  module ClassMethods
    attr_accessor :validations

    def validate(attr_name, validation_type, *params)
      @validations ||= []
      validation_hash = { attr_name: attr_name, method: "validate_#{validation_type}", params: params }
      @validations << validation_hash
    end
  end

  module InstanceMethods
    def validate!
      self.class.validations.each do |validation_hash|
        method = (validation_hash[:method]).to_s.to_sym
        instance_variable = validation_hash[:attr_name]
        params = validation_hash[:params]
        send(method, instance_variable_get("@#{instance_variable}"), params)
      end
      true
    rescue StandardError => e
      puts e.message
    end

    def validate?
      validate! ? true : false
    end

    def validate_presence(var, *params)
      raise "Presence validation failed" if var.nil?

      puts "Presence validation succesfull"
    end

    def validate_format(var, params)
      raise "Format validation failed" if var !~ params[0]

      puts "Format validation succesfull"
    end

    def validate_type(var, params)
      raise "Type validation failed" unless var.instance_of?(params[0])

      puts "Type validation succesfull"
    end
  end
end

class Test
  include Validation
  def initialize(name)
    @name = name
  end
  validate :name, :presence
  validate :name, :format, /\w/
  validate :name, :type, String
end
