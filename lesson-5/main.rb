#seed ON
require_relative 'route'
require_relative 'station'
require_relative 'train'
require_relative 'passenger_train'
require_relative 'cargo_train'
require_relative 'wagons'
require_relative 'passenger_wagon'
require_relative 'cargo_wagon'

class RailRoad
attr_reader :stations, :routes, :trains
  def initialize
    @stations = []
    @routes = []
    @trains = []
    @wagons = []
    @rr
  end
  puts "It's RailRoad simulator!"

  def menu
    loop do
    puts "Enter 1, if you want to create: train, station, route or wagon"
    puts "Enter 2, if want to do something"
    puts "Enter 3, to show info"
    puts "Enter 0 or stop, to stop program"

    choice = gets.chomp.to_i

    case choice
      when 1 then create
      when 2 then operations
      when 3 then info
      when 0 then break
    end
   end
  end

  def create
    puts "Enter 1, if you want create station"
    puts "Enter 2, if you want create route"
    puts "Enter 3, if you want create train"
    puts "Enter 4, if you want create wagon"


    choice_2 = gets.chomp.to_i

    case choice_2
      when 1 then create_station
      when 2 then create_route
      when 3 then create_train
      when 4 then create_wagon
      else puts "Enter 1-4 numbers"
    end
    puts "ok"
  end

  def operations
    puts "Enter 1, if you want add station to route"
    puts "Enter 2, if you want delete station on route"
    puts "Enter 3, if you want add route for train"
    puts "Enter 4, if you want hook wagon to train"
    puts "Enter 5, if you want unhook wagon from the train"
    puts "Enter 6, if you want move train to next station"
    puts "Enter 7, if you want move train to last station"

  choice_3 = gets.chomp.to_i
    case choice_3
      when 1 then add_way_station
      when 2 then delete_way_station
      when 3 then take_route
      when 4 then add_wagon
      when 5 then unhook_wagon
      when 6 then move_to_next_station
      when 7 then move_to_last_station
    end
  end

  def info
    puts "Enter 1, to show station list"
    puts "Enter 2, to show trains on station"

  choice_4 = gets.chomp.to_i
    case choice_4
    when 1 then station_list
      when 2 then trains_list_on_station
    end
  end

  def create_station
    puts "Create station"
    puts "Enter new station name: "
    station_name = gets.chomp
    @stations << Station.new(station_name)
    puts "Station created: #{find_station(station_name)}"
  end

  def create_route
    puts "Route creation menu"
    puts "Enter name of new route"
    route_name = gets.chomp
    puts "Enter name of start station from station list: "
    puts @stations.inspect
    start_station = gets.chomp.to_s
    object_start_station = find_station(start_station)
    puts "Start station: #{object_start_station}"
    puts "Enter name of final station: "
    final_station = gets.chomp.to_s
    object_final_station = find_station(final_station)
    puts "Final station: #{object_final_station}"
    @routes << Route.new(route_name, object_start_station, object_final_station)
    puts "Ok, you are created new route: #{find_route(route_name)}"
  end

  def create_train
    puts "Train creation menu"
    puts "Set type of train"
    puts "Cargo train: enter 1"
    puts "Passenger train: enter 2"
    choice_train_type = gets.chomp.to_i
      case choice_train_type
        when 1 then
          puts "Set cargo train number"
          train_name = gets.chomp.to_s
          @trains << CargoTrain.new(train_name)
        when 2 then
          puts "Set passenger train number"
          train_name = gets.chomp.to_s
          @trains << PassengerTrain.new(train_name)
      end
  end

  def create_wagon
    puts "Wagon creation menu"
    puts "Set type of wagon"
    puts "Cargo wagon - enter 1"
    puts "Passenger wagon - enter 2"
    choice_wagon_type = gets.chomp.to_i
      case choice_wagon_type
        when 1 then
          @wagons << CargoWagon.new
          puts "Congratulation! You created cargo wagon!"
        when 2 then
          @wagons << PassengerWagon.new
          puts "Congratulation! You created passenger wagon!"
      end
  end
#def operations
  def add_way_station
    puts "Add station operator"
    puts "Enter name of new way station"
    way_station = gets.chomp.to_s
    object_way_station = Station.new(way_station)
    puts "You set: #{object_way_station}"
    puts "Set route from list"
    puts @routes.inspect
    route = gets.chomp.to_s
    object_route = find_route(route)
    object_route.add_way_station(object_way_station)
    puts "Route list updated: #{@routes}"
  end

  def delete_way_station
    puts "Delete station operator"
    puts "Enter name of route:"
    puts @routes.inspect
    route = gets.chomp.to_s
    object_route = find_route(route)
    puts "Enter name of station which you want to delete"
    puts "#{object_route.stations}"
    station_name = gets.chomp.to_s
    puts "You set: #{find_station(station_name)}"
    object_station = find_station(station_name)
    object_route.delete_way_station(object_station)
    puts "Station on route now: #{object_route.stations}"
  end

  def take_route
    puts "Enter route name from list of routes"
    puts "#{@routes}"
    route = gets.chomp.to_s
    object_route = find_route(route)
    puts object_route
    puts "Set train"
    puts "#{@trains}"
    train_name = gets.chomp.to_s
    object_train = find_train(train_name)
    object_train.take_route(object_route)
    puts "For train: #{object_train} Route now: #{object_route} "
  end

  def add_wagon
    puts "Add wagon menu"
    puts "Set train name from list:"
    puts "#{@trains}"
    train_name = gets.chomp.to_s
    object_train = find_train(train_name)
    puts "Cargo wagon: enter 1"
    puts "Passenger wagon: enter 2"
    choice_wagon_type = gets.chomp.to_i
      case choice_wagon_type
        when 1 then
          wagon  = CargoWagon.new
          if wagon.wagon_type == object_train.train_type #почему-то в одну строку не работает
            object_train.add_wagon(wagon)
            puts "Congratulation! Cargo wagon created and hook to train"
          else
            puts "No. Types of carriage and train do not match"
          end
        when 2 then

          wagon  = PassengerWagon.new

          if wagon.wagon_type == object_train.train_type #почему-то в одну строку не работает
            object_train.add_wagon(wagon)
            puts "Congratulation! Passenger wagon created and hook to train"
          else
            puts "No. Types of carriage and train do not match"
          end
      end
  end

  def unhook_wagon
    #мы будем удалять и прицеплять указанное количество вагонов из массива @wagon_amount
    puts "Unhook wagon menu"
    puts "Set train, enter train name"
    puts "#{@trains}"
    train_name = gets.chomp.to_s
    object_train = find_train(train_name)
    puts "#{object_train.wagon_amount}"
    puts "Set SUM of wagons"
    sum = gets.chomp.to_i
    object_train.unhook_wagon(sum)
    puts "Unhooked wagons in #{object_train}: #{object_train.wagon_amount}"
  end


  def current_station
    puts "Set train name from list"
    puts "#{@trains}"
    train  = gets.chomp.to_s
    train_object = find_train(train)
    puts "Current_station: #{train_object.current_station}"
    train_object.current_station.trains << train_object
  end

  def move_to_next_station
    puts "Move to next station"
    puts "Set train name from list"
    puts "#{@trains}"
    train  = gets.chomp.to_s
    train_object = find_train(train)
    puts "Current_station: #{train_object.current_station}"
    object_station = train_object.current_station
    puts "#{object_station}"
    current_station = train_object.move_to_next_station
    puts "Current_station NOW: #{current_station}"
  end

  def move_to_last_station
    puts "Move to last station"
    puts "Set train name from list"
    puts "#{@trains}"
    train  = gets.chomp.to_s
    train_object = find_train(train)
    puts "Current_station: #{train_object.current_station}"
    object_station = train_object.current_station
    puts "#{object_station}"
    current_station = train_object.move_to_last_station
    puts "Current_station NOW: #{current_station}"
  end

#def info


  def station_list
    puts "#{@stations}"
  end

  def trains_list_on_station
    puts "Set station"
    puts "#{@stations}"
    #поменять переменные
    station = gets.chomp.to_s
    station_choice = find_station(station)
    puts "Trains: #{station_choice.trains}"

  end

  def find_station(name)
    @stations.find {|station| station.station_name == name}
  end

  def route_list
    @routes.each {|name| puts @name}
  end

  def find_route(name)
    @routes.find {|route| route.route_name == name}
  end

  def find_train(name)
    @trains.find {|train| train.train_name == name}
  end

  def seed
    station_name = "go"
    @stations << Station.new(station_name)
    station_name = "foo"
    @stations << Station.new(station_name)
    station_name = "bar"
    @stations << Station.new(station_name)
    start_station = find_station("go")
    final_station = find_station("bar")
    route_name = "msc"
    Route.new(route_name, start_station, final_station)
    @routes << Route.new(route_name, start_station, final_station)
    @trains << PassengerTrain.new('tomas')
    @wagons << CargoWagon.new
  end
end
@rr = RailRoad.new
@rr.seed
@rr.menu
