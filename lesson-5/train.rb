class Train
  attr_accessor :speed, :wagon_amount
  arrt_reader :train_route

  def initialize(train_number, type, wagon_amount, speed = 0)
    @train_number = train_number
    #:passenger, :cargo
    @type = type
    @wagon_amount = wagon_amount
    @speed = speed
  end

  def stop
    @speed = 0
  end

  def unhook_wagon
    if @speed == 0
      @wagon_amount -= 1
    else
      puts "Stop the train first!"
    end
  end

  def add_wagon
    if @speed == 0
      @wagon_amount += 1
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
    @train_route.stations[@station_selector]
  end

  def move_to_next_station
    if show_next_station
      @station_selector += 1
      @train_route.stations[@station_selector]
    end
  end

  def move_to_last_station
    if @station_selector > 0
      @station_selector -= 1
      @train_route.stations[@station_selector]
    end
  end

  def show_next_station
    if current_station != @train_route.stations.last
      @train_route.stations[@station_selector + 1]
    end
  end

  def show_last_station
    if @station_selector > 0
     @train_route.stations[@station_selector + 1]
    end
  end
end
