
require_relative 'wagons'


class CargoWagon < Wagons
  def initialize(wagon_type = :cargo)
    @wagon_type = wagon_type
  end
end
