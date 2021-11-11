require_relative 'manufacturer'
require_relative 'instancecounter'
class Wagon
  attr_reader :wagon_type
  include Manufacturer
  TRAIN_TYPE = /cargo|passenger/

  def initialize(wagon_type)
    @wagon_type = wagon_type
    validate!
  end

  def validate!
    raise "Wagon has invalid format" if wagon_type !~ TRAIN_TYPE
  end

  def validate?
    validate!
    true
  rescue
    false
  end
end
