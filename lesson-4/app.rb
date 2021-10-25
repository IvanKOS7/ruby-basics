class Station
attr_reader :station_name, :trains

  def initialize(station_name)
    @station_name = station_name
    @trains = []
  end

  def add_train(train)
    trains << train
  end

  def send_train(train)
    trains.delete(train)
  end

  def trains_type(type)
     @trains.count { |train| train.type == type }
   end
end


class Route
  attr_reader :stations

  def initialize(start_station, final_station)
    @start_station = start_station
    @final_station = final_station
    @stations = []
    @stations << start_station << final_station
  end

  def add_way_station(way_station)
    stations.insert(-2, way_station)
  end

  def delete_way_station(way_station)
    stations.delete(way_station)
  end
end


class Train
  attr_accessor :speed, :wagon_amount, :train_route

  def initialize(train_number, type, wagon_amount, speed = 0)
    @train_number = train_number
    #:passenger, :cargo
    @type = type
    @wagon_amount = wagon_amount
    @speed = speed
    @train_route = train_route
  end

  def stop
    @speed = 0
  end

  def unhook_wagon
    if @speed == 0
      @wagon_amount -= 1
      puts "You unhooked the wagon now. Wagon's amount: #{@wagon_amount}"
    else
      puts "Stop the train first!"
    end
  end

  def add_wagon
    if @speed == 0
      @wagon_amount += 1
      puts "You add the wagon now. Wagon's amount: #{@wagon_amount}"
    else
      puts "Stop the train first!"
    end
  end

  def take_route(route)
    @train_route = route
    @station_selector = 0
    @train_route.stations[@station_selector]
  end

  def current_station
    puts "Your station #{@train_route.stations[@station_selector]}"
  end

  def forward_station
    @station_selector += 1
    puts "Your station #{@train_route.stations[station_selector]}"
  end

  def last_station
    @station_selector -= 1
    puts "Your station #{@train_route.stations[station_selector]}"
  end
end
