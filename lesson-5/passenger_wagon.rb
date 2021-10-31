require_relative 'wagon'

class PassengerWagon < Wagon
  def initialize(wagon_type = :passenger)
    @wagon_type = wagon_type
  end
end
