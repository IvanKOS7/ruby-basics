require_relative 'instancecounter'
require_relative 'manufacturer'
class Route
  attr_reader :stations, :route_name
  include InstanceCounter

  def initialize(route_name, start_station, final_station)
    @route_name = route_name
    @stations = [start_station, final_station]
    register_instance
  end

  def add_way_station(way_station)
    stations.insert(-2, way_station)
  end

  def delete_way_station(way_station)
    stations.delete(way_station)
  end
end
