# frozen_string_literal: true

require_relative 'instancecounter'
require_relative 'manufacturer'
require_relative 'wagon'

class CargoWagon < Wagon
  attr_reader :total_volume, :occupied_volume

  def initialize(total_volume)
    @wagon_type = 'cargo'
    @occupied_volume = 0
    @total_volume = total_volume
  end

  def load_wagon(volume)
    @occupied_volume = volume if @total_volume >= volume
  end

  def free_volume
    @free_volume = @total_volume - @occupied_volume
  end
end
