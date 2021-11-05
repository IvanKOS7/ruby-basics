require_relative 'instancecounter'
require_relative 'manufacturer'

class Route
  attr_reader :stations, :route_name
  include InstanceCounter
  STATION_FORMAT = /\w+/
  ROUTE_FORMAT = STATION_FORMAT

  def initialize(route_name, start_station, final_station)
    @route_name = route_name
    @start_station = start_station
    @final_station = final_station
    @stations = [start_station, final_station]
    validate!
    register_instance
  end

  def validate!
    raise "Route name has invalid format" if route_name !~ STATION_FORMAT
    raise "Start station has invalid format" if start_station !~ STATION_FORMAT
    raise "Final station has invalid format" if final_station !~ STATION_FORMAT
  end

  def validate?
    validate!
    true
  rescue
    false
  end

  def add_way_station(way_station)
    stations.insert(-2, way_station)
  end

  def delete_way_station(way_station)
    stations.delete(way_station)
  end
end
