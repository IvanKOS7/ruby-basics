require_relative 'wagon'
require_relative 'manufacturer'
require_relative 'instancecounter'
class PassengerWagon < Wagon
  def initialize(wagon_type = 'passenger')
    @wagon_type = wagon_type
  end
end
