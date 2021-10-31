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
    if @speed == 0 && train_type == wagon.wagon_type
     delete_wagon = @wagon_amount.shift(wagon_sum)
   end
  end

  def add_wagon(wagon)
    if @speed == 0 && train_type == wagon.wagon_type
      @wagon_amount << wagon
    end
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
    if @station_selector > 0
      @station_selector -= 1
      @current_route.stations[@station_selector]
    end
  end
private #потомкам нет необходимости знать это, функционал не требует
  def show_next_station

    if current_station != @current_route.stations.last
      @current_route.stations[@station_selector + 1]
    end
  end

  def show_last_station
    if @station_selector > 0
     @current_route.stations[@station_selector + 1]
    end
  end
end
