# frozen_string_literal: true

require_relative 'module_validation_v2'
# require_relative 'manufacturer'
# require_relative 'instancecounter'

class Station
  include Validation
  attr_reader :station_name, :trains

  validate :station_name, :format, /\w+/
  @@all = []
  STATION_FORMAT = /\w+/.freeze
  def initialize(station_name)
    @station_name = station_name
    @trains = []
    @@all << self
    # register_instance
  end

  def trains_block(&block)
    @trains.each(&block)
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
