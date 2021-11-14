# frozen_string_literal: true

require_relative 'manufacturer'
require_relative 'instancecounter'

class Train
  attr_accessor :speed, :train_type, :train_route
  attr_reader :train_name, :wagon_amount, :train_number

  include Manufacturer
  include InstanceCounter
  TRAIN_TYPE = /cargo|passenger/.freeze
  TRAIN_NAME_FORMAT = /\w+/.freeze
  TRAIN_NUMBER_FORMAT = /[a-z0-9]{3}-*[a-z0-9]{2}/.freeze
  @@instances = []

  def initialize(train_name, train_number, train_type)
    @train_name = train_name
    @train_type = train_type
    @train_number = train_number
    @wagon_amount = []
    @speed = 0
    @train_route = []
    validate!
    @@instances << self
    register_instance
  end

  def wagons_block(&block)
    @wagon_amount.each(&block)
  end

  def validate!
    raise "Train has invalid format" if train_name !~ TRAIN_NAME_FORMAT
    raise "Train type has invalid format" if train_type !~ TRAIN_TYPE
    raise "Train number has invalid format" if train_number !~ TRAIN_NUMBER_FORMAT
  end

  def validate?
    validate!
    true
  rescue StandardError
    false
  end

  def stop
    @speed = 0
  end

  def unhook_wagon(wagon_sum)
    @wagon_amount.shift(wagon_sum) if @speed.zero? && train_type == wagon.wagon_type
  end

  def add_wagon(wagon)
    @wagon_amount << wagon if @speed.zero? && train_type == wagon.wagon_type
  end

  def take_route(route)
    @train_route << route
    @station_selector = 0
    @train_route[@station_selector]
  end

  def current_station
    @current_route = @train_route[0]
    @current_route.stations[@station_selector]
  end

  def move_to_next_station
    if show_next_station
      @station_selector += 1
      @current_route.stations[@station_selector]
    end
  end

  def move_to_last_station
    if @station_selector.positive?
      @station_selector -= 1
      @current_route.stations[@station_selector]
    end
  end

  def self.find_train(number)
    @@instances.find { |train| train.train_number == number }
  end

  private

  def show_next_station
    @current_route.stations[@station_selector + 1] if current_station != @current_route.stations.last
  end

  def show_last_station
    @current_route.stations[@station_selector + 1] if @station_selector.positive?
  end
end
