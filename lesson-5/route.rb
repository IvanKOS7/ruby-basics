class Route
  attr_reader :stations

  def initialize(start_station, final_station)
    @stations = [start_station, final_station]
  end

  def add_way_station(way_station)
    stations.insert(-2, way_station)
  end

  def delete_way_station(way_station)
    stations.delete(way_station)
  end
end
