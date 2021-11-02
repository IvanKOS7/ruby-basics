require_relative 'manufacturer'
require_relative 'instancecounter'
class Wagon
  attr_reader :wagon_type
  include Manufacturer
  def initialize(wagon_type)
    @wagon_type = wagon_type
  end
end
