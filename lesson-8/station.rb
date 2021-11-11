require_relative 'manufacturer'
require_relative 'instancecounter'

class Station
  include InstanceCounter
  attr_reader :station_name, :trains
  @@all = []
  STATION_FORMAT = /\w+/

  def initialize(station_name)
    @station_name = station_name
    @trains = []
    @@all << self
    validate!
    register_instance
  end
  #block  {|train| train}

  def trains_block
     @trains.each {|train| yield}
  end

  def validate!
    raise "Station name has invalid format" if station_name !~ STATION_FORMAT
  end

  def validate?
    validate!
    true
  rescue
    false
  end

  def add_train(train)
    trains << train
  end

  def self.all
    @@all
  end

private
  def send_train(train)
    trains.delete(train)
  end

  def show_trains_type(type)
     @trains.count { |train| train.type == type }
   end
end
