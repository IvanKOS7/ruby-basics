require_relative 'instancecounter'
require_relative 'manufacturer'
require_relative 'wagon'


class CargoWagon < Wagon
  attr_reader :total_volume, :occupied_volume
  def initialize(wagon_type = 'cargo', total_volume)
    @occupied_volume = 0
    @total_volume = total_volume
    @wagon_type = wagon_type
  end

  def load_wagon(volume)
    if @total_volume >= volume
      @occupied_volume = volume
    end
  end

  def free_volume
    @free_volume = @total_volume - @occupied_volume
  end
end
