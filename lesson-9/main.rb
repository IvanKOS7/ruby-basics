# frozen_string_literal: true

# seed ON
require_relative 'route'
require_relative 'station'
require_relative 'train'
require_relative 'passenger_train'
require_relative 'cargo_train'
require_relative 'wagon'
require_relative 'passenger_wagon'
require_relative 'cargo_wagon'

class RailRoad
  attr_reader :stations, :routes, :trains

  def initialize
    @stations = []
    @routes = []
    @trains = []
    @wagons = []
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
    route = find_route(route_name)
    train = PassengerTrain.new('tomas', 'bbb-55')
    @trains << train
    train.take_route(route)
    route.stations[0].add_train(train)
    wagon = PassengerWagon.new(34)
    @wagons << wagon
    train.add_wagon(wagon)
  end

  def menu
    loop do
      puts "It's RailRoad simulator!"
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

  private

  def create
    puts "Enter 1, if you want create station"
    puts "Enter 2, if you want create route"
    puts "Enter 3, if you want create train"
    puts "Enter 4, if you want create wagon"

    choice2 = gets.chomp.to_i

    case choice2
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
    puts "Enter 8, if you want to load wagon(cargo only)"
    puts "Enter 9, if you want to take seat(passenger only)"
    choice3 = gets.chomp.to_i
    case choice3
    when 1 then add_way_station
    when 2 then delete_way_station
    when 3 then take_route
    when 4 then add_wagon
    when 5 then unhook_wagon
    when 6 then move_to_next_station
    when 7 then move_to_last_station
    when 8 then load_wagon
    when 9 then take_seat
    end
  end

  def info
    puts "Enter 1, to show station list"
    puts "Enter 2, to show trains on station"
    puts "Enter 3, to show wagons on train"
    puts "enter 4 for all"
    choice4 = gets.chomp.to_i
    case choice4
    when 1 then station_list
    when 2 then trains_list_on_station
    when 3 then wagons_on_train
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

    puts "Enter train name"
    train_name = gets.chomp.to_s
    puts "Enter train type: cargo or passenger "
    train_type = gets.chomp.to_s
    puts "Set #{train_type.upcase} train number. Example: srf-55"
    train_number = gets.chomp.to_s
    begin
      train = Train.new(train_name, train_type, train_number)
      @trains << train
      puts "You created: #{train.inspect}"
    rescue RuntimeError => e
      puts "Let's Try Again"
      puts e.message
      create_train
    end
  end

  def create_wagon
    puts "Wagon creation menu"
    puts "Set type of wagon"
    puts "Cargo wagon - enter 1"
    puts "Passenger wagon - enter 2"
    choice_wagon_type = gets.chomp.to_i
    case choice_wagon_type
    when 1
      puts "Enter volume of new cargo wagon"
      volume = gets.chomp.to_i
      wagon = CargoWagon.new(volume)
      @wagons << wagon
      puts "Congratulation! You created: #{wagon}! Total volume: #{volume}"
    when 2
      puts "Enter total seats of new passenger wagon"
      sets = gets.chomp.to_i
      wagon = PassengerWagon.new(sets)
      @wagons << wagon
      puts "Congratulation! You created: #{wagon}! Total sets: #{volume}"
    end
  end

  # def operations
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
    puts object_route.stations.to_s
    station_name = gets.chomp.to_s
    puts "You set: #{find_station(station_name)}"
    object_station = find_station(station_name)
    object_route.delete_way_station(object_station)
    puts "Station on route now: #{object_route.stations}"
  end

  def take_route
    puts "Enter route name from list of routes"
    puts route_list.to_s
    route = gets.chomp.to_s
    object_route = find_route(route)
    puts object_route
    puts "Set train"
    puts @trains.to_s
    train_name = gets.chomp.to_s
    object_train = find_train(train_name)
    object_train.take_route(object_route)
    object_route.stations[0].add_train(object_train)
    puts "For train: #{object_train} Route now: #{object_route}"
  end

  def add_wagon
    puts "Add wagon menu"
    puts "Set train name from list:"
    puts @trains.to_s
    train_name = gets.chomp.to_s
    object_train = find_train(train_name)
    puts "Cargo wagon: enter 1"
    puts "Passenger wagon: enter 2"
    choice_wagon_type = gets.chomp.to_i
    case choice_wagon_type
    when 1
      wagon = CargoWagon.new
      if wagon.wagon_type == object_train.train_type
        object_train.add_wagon(wagon)
        puts "Congratulation! Cargo wagon created and hook to train"
      else
        puts "No. Types of carriage and train do not match"
      end
    when 2
      wagon = PassengerWagon.new
      if wagon.wagon_type == object_train.train_type
        object_train.add_wagon(wagon)
        puts "Congratulation! Passenger wagon created and hook to train"
      else
        puts "No. Types of carriage and train do not match"
      end
    end
  end

  def unhook_wagon
    puts "Unhook wagon menu"
    puts "Set train, enter train name"
    puts @trains.to_s
    train_name = gets.chomp.to_s
    object_train = find_train(train_name)
    puts object_train.wagon_amount.to_s
    puts "Set SUM of wagons"
    sum = gets.chomp.to_i
    object_train.unhook_wagon(sum)
    puts "Unhooked wagons in #{object_train}: #{object_train.wagon_amount}"
  end

  def current_station(train_name)
    object_train = find_train(train_name)
    object_train.current_station.trains << object_train
  end

  def move_to_next_station
    puts "Move to next station"
    puts "Set train name from list"
    puts @trains.to_s
    train = gets.chomp.to_s
    train_object = find_train(train)
    puts "Current_station: #{train_object.current_station}"
    object_station = train_object.current_station
    puts object_station.to_s
    current_station = train_object.move_to_next_station
    puts "Current_station NOW: #{current_station}"
  end

  def move_to_last_station
    puts "Move to last station"
    puts "Set train name from list"
    puts @trains.to_s
    train = gets.chomp.to_s
    train_object = find_train(train)
    puts "Current_station: #{train_object.current_station}"
    object_station = train_object.current_station
    puts object_station.to_s
    current_station = train_object.move_to_last_station
    puts "Current_station NOW: #{current_station}"
  end

  def load_wagon
    puts "Set cargo wagon volume  from list"
    puts @wagons.inspect
    wagon_volume = gets.chomp.to_i
    choice = find_wagon_cargo('cargo', wagon_volume)
    puts "You set: #{choice.inspect}"
    puts "Enter loading volume"
    volume = gets.chomp.to_i
    choice.load_wagon(volume)
    puts choice.inspect.to_s
  end

  def take_seat
    puts "Set passenger wagon total seats  from list"
    puts @wagons.inspect
    wagon_seats = gets.chomp.to_i
    choice = find_wagon_passenger('passenger', wagon_seats)
    puts "You set: #{choice.inspect}"
    loop do
      puts "Enter  1 if you want to put a passenger"
      puts "Enter  0 if you want to exit"
      user_choise = gets.chomp.to_i
      case user_choise
      when 1
        choice.take_seat
        puts "You put 1 passenger, occupied_seats now: #{choice.occupied_seat}, free seats: #{choice.total_seat - choice.occupied_seat}"
      when 0 then break
      end
    end
  end
  # def info

  def station_list
    puts @stations.to_s
  end

  def trains_list_on_station
    @stations.each { |station| puts "For #{station}: #{station.trains}" }
  end

  # def trains_list_on_station
  #   trains_block {|train| puts train}
  # end
  def wagons_on_train
    @trains.each { |train| puts "For #{train}: #{train.wagon_amount}" }
  end

  def find_station(name)
    @stations.find { |station| station.station_name == name }
  end

  def route_list
    @routes.each(&:inspect)
  end

  def find_route(name)
    @routes.find { |route| route.route_name == name }
  end

  def find_train(name)
    @trains.find { |train| train.train_name == name }
  end

  def find_wagon_cargo(type, vol)
    @wagons.find { |wagon| wagon.wagon_type == type && wagon.total_volume == vol }
  end

  def find_wagon_passenger(type, seat)
    @wagons.find { |wagon| wagon.wagon_type == type && wagon.total_seat == seat }
  end
end
rr = RailRoad.new
rr.seed
rr.menu
