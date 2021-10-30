class Train
  attr_accessor :speed, :train_type, :train_route
  attr_reader :train_name, :wagon_amount

  def initialize(train_name, train_type)
    @train_name = train_name
    #:passenger, :cargo
    @train_type = train_type
    @wagon_amount = []
    @speed = 0
    @train_route = []
  end


  def stop
    @speed = 0
  end

  def unhook_wagon(wagon_sum)
    del = @wagon_amount.shift(wagon_sum)
  end

  def add_wagon(wagon)
    @wagon_amount << wagon
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
    #здесь скорее всего нужно какое-то условие
      @station_selector += 1
      @current_route.stations[@station_selector]
  end

  def move_to_last_station
    #здесь тоже
      @station_selector -= 1
      @current_route.stations[@station_selector]
  end

  def show_next_station
    #пока не могу понять надо ли мне это вообще
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
