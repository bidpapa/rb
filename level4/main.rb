require_relative 'station'
require_relative 'train'
require_relative 'route'
require_relative 'cargo_train'
require_relative 'passenger_train'
require_relative 'cargo_wagon'
require_relative 'passenger_wagon'

class Main

  attr_reader :stations, :trains, :routes

  def initialize
    @stations = []
    @trains = []
    @routes = []    
  end

  def show_main_menu
    puts "Список команд:"
    puts "1 - добавить станции"
    puts "2 - добавить поезда"
    puts "3 - создать маршрут"
    puts "4 - назначить поезду маршрут"
    puts "5 - добавить вагон поезду"
    puts "6 - перемещение поезда"
    puts "7 - проверить поезда на станции"
    puts "8 - добавить станцию на маршрут"
    puts "9 - убрать станцию"
    puts "10 - убрать вагон поезда"
    puts "11 - показать список станций"
    puts "12 - выход"
  
  end

  def run
    loop do
      show_main_menu
      command = gets.to_i
      case command
      when 1 then add_stations    
      when 2 then add_trains    
      when 3 then add_route    
      when 4 then add_train_route    
      when 5 then add_train_wagon    
      when 6 then move_train    
      when 7 then check_station_trains    
      when 8 then add_station_to_route    
      when 9 then delete_station_from_route    
      when 10 then remove_train_wagon    
      when 11 then show_stations   
      end
      break if command == 12
    end
  end

  def add_stations
    puts "Введите название станции"
    station_name = gets.chomp  
    @stations << Station.new(station_name)
  end

  def add_trains
    puts "Введите тип создаваемого поезда. 1 - Пассажирский, 2 - Грузовой"
    train_type = gets.to_i
    puts "Введите номер поезда"
    train_number = gets.to_i
    @trains.push(PassengerTrain.new(train_number, 'passenger')) if train_type == 1
    @trains.push(CargoTrain.new(train_number, 'cargo')) if train_type == 2    
  end

  def add_route
    @stations.map.with_index(1) do |station, index| 
      puts "#{index} - #{station.name}"
    end
    puts "Введите номер станции, которую делаете стартовой в маршруте"
    start_station_number = gets.to_i
    puts "Введите номер станции, которую делаете конечной в маршруте"
    finish_station_number = gets.to_i
    @routes.push(Route.new(@stations[start_station_number - 1], @stations[finish_station_number - 1]))
  end

  def add_station_to_route
    @stations.map.with_index(1) do |station, index| 
      puts "#{index} - #{station.name}"
    end
    puts "Введите номер станции, которую добавляете в маршрут"
    station_to_add = gets.to_i

    @routes.map.with_index(1) do |route, index| 
      puts "#{index} - #{route.stations}"
    end
    puts "Введите номер маршрута, в который добавляете станцию"
    selected_route = gets.to_i
    
    @routes[selected_route - 1].add_station(@stations[station_to_add - 1].name)
  end

  def delete_station_from_route
    @stations.map.with_index(1) do |station, index| 
      puts "#{index} - #{station.name}"
    end
    puts "Введите номер станции, которую удаляете из маршрута"
    station_to_del = gets.to_i

    @routes.map.with_index(1) do |route, index| 
      puts "#{index} - #{route.stations}"
    end
    puts "Введите номер маршрута, из которого убираете станцию"
    selected_route = gets.to_i

    @routes[selected_route - 1].delete_station(@stations[station_to_del - 1].name)
  end
    
  def add_train_route
    @trains.map.with_index(1) do |train, index| 
      puts "#{index} - #{train.type} (#{train.number})"
    end
    puts "Введите номер поезда, который добавляете в маршрут"
    selected_train = gets.to_i

    @routes.map.with_index(1) do |route, index| 
      puts "#{index} - #{route.stations}"
    end
    puts "Введите номер маршрута для поезда"
    selected_route = gets.to_i
    
    @trains[selected_train - 1].set_route(@routes[selected_route - 1])  
  end
    
  def add_train_wagon
    @trains.map.with_index(1) do |train, index| 
      puts "#{index} - #{train.type} (#{train.number})"
    end
    puts "Введите номер поезда, которому добавляете вагон"
    selected_train = gets.to_i

    puts @trains[selected_train - 1].type

    wagon_type = CargoWagon.new if @trains[selected_train - 1].type == 'cargo'
    wagon_type = PassengerWagon.new if @trains[selected_train - 1].type == 'passenger'

    puts wagon_type

    @trains[selected_train - 1].add_wagon(wagon_type)
    puts @trains[selected_train - 1].wagons.size
  end

  def remove_train_wagon
    trains.map.with_index(1) do |train, index| 
      puts "#{index} - #{train.type} (#{train.number})"
    end
    puts "Введите номер поезда, который добавляете в маршрут"
    selected_train = gets.to_i

    @trains[selected_train - 1].remove_wagon
    puts @trains[selected_train - 1].wagons.size
  end
   
  def move_train
    loop do
      @trains.map.with_index(1) do |train, index| 
      puts "#{index} - #{train.type} (#{train.number})"
      end
      puts "Введите номер поезда, который будет перемещен"
      selected_train = gets.to_i

      puts "Введите ahead для движения вперед. Введите back для движения назад. stop - завершить"
      direction = gets.chomp
      break if direction == 'stop' 

      @trains[selected_train - 1].move_ahead if direction == 'ahead'
      @trains[selected_train - 1].move_back if direction == 'back'
    end   
  end

  def check_station_trains
    @stations.map.with_index(1) do |station, index| 
      puts "#{index} - #{station.name}"
    end
    puts "Введите номер станции, чтобы проверить поезда на ней"
    selected_station = gets.to_i

    puts "Поездов тут нет" if @stations[selected_station - 1].trains.empty?

    puts @stations[selected_station - 1].trains
  end

  def show_stations
    @stations.each {|station| puts station.name}    
  end

end
