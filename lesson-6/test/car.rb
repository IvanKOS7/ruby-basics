module FuelTank
  def fill_tank(level)
    self.fuel_tank = level
  end

  def fuel_level
    self.fuel_tank
  end
  protected
  attr_accessor :fuel_tank
end

module Debugger
  def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethods
  end
 module ClassMethods
   def debug(log)
    puts "Deb #{log}"
  end
end
  module InstanceMethods
    def debug(log)
      self.class.debug(log)
    end
    def print_class
      puts self.class
    end
  end
end
class Car
  include FuelTank #включает методы инстанса
include Debugger#методы как методы класса
  attr_reader :current_rpm

  @@instances = 0

  def self.instances
    @@instances
  end

  def self.debug(log)
    puts "Deb #{log}"
  end

  debug "Zdarova"

  def initialize
    @current_rpm = 0
    @@instances += 1
    self.class.debug "init blya"
  end

  def fill_tank(level)
    fuel_tank = level
  end

  def fuel_level
    self.fuel_tank
  end

  def start_engine
    start_engine! if engine_stopped?
  end

  debug "GUUUUUTYAA"

  protected

  attr_writer :current_rpm
  attr_accessor :fuel_level

  def initial_rpm
    800
  end
  def start_engine!
    self.current_rpm = initial_rpm
  end
end

class Motorbike
  include FuelTank
include Debugger
end
