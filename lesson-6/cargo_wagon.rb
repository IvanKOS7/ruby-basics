require_relative 'instancecounter'
require_relative 'manufacturer'
require_relative 'wagon'


class CargoWagon < Wagon
  def initialize(wagon_type = :cargo)
    @wagon_type = wagon_type
  end
end
