require_relative 'manufacturer'
require_relative 'instancecounter'
class Station
  include InstanceCounter
  attr_reader :station_name, :trains

  @@all = []

  def initialize(station_name)
    @station_name = station_name
    @trains = []
    @@all << self
    register_instance
  end


  def add_train(train)
    trains << train
  end

  def self.all
    @@all
  end

private #потомкам нет необходимости знать это, функционал не требует
  def send_train(train)
    trains.delete(train)
  end

  def show_trains_type(type)
     @trains.count { |train| train.type == type }
   end
end
