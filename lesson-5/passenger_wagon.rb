require_relative 'wagons'


class PassengerWagon < Wagons
  def initialize(wagon_type = :passenger)
    @wagon_type = wagon_type
  end
end
