# frozen_string_literal: true

require_relative 'wagon'
require_relative 'manufacturer'
require_relative 'instancecounter'
class PassengerWagon < Wagon
  attr_reader :total_seat, :occupied_seat

  def initialize(total_seat)
    @total_seat = total_seat
    @wagon_type = 'passenger'
    @occupied_seat = 0
  end

  def take_seat
    @occupied_seat += 1 if @total_seat > occupied_seat
    occupied_seat
  end
end
