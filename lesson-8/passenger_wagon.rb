require_relative 'wagon'
require_relative 'manufacturer'
require_relative 'instancecounter'
class PassengerWagon < Wagon
  attr_reader :total_seat
  def initialize(wagon_type = 'passenger', total_seat)
    @total_seat = total_seat
    @wagon_type = wagon_type
    @occupied_seat = 0
  end

  def take_seat
    if @total_seat > occupied_seat
      @occupied_seat += 1
      occupied_seat
    end
  end

  def occupied_seat
    @occupied_seat
  end

end
