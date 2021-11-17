# frozen_string_literal: true

#require_relative 'manufacturer'
#require_relative 'instancecounter'
class Wagon
  attr_reader :wagon_type

  include Validation
  TRAIN_TYPE = /cargo|passenger/.freeze
  validate :wagon_type, :format, TRAIN_TYPE
  def initialize(wagon_type)
    @wagon_type = wagon_type
  end
end
