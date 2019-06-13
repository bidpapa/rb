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
      when 11 then show_stations(@stations)
      when 12 then break
      end      
    end
  end

  private

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

  def add_stations
    puts "Введите название станции"
    station_name = gets.chomp  
    @stations << Station.new(station_name)
  end

  def add_trains
    puts "Введите тип создаваемого поезда. 1 - Пассажирский, 2 - Грузовой"
    train_type = gets.to_i
    puts "Введите номер поезда"
    train_number = gets.chomp
    case train_type
      when 1 then @trains << PassengerTrain.new(train_number)
      when 2 then @trains << CargoTrain.new(train_number)
    end   
  end

  def add_route
    show_stations(@stations)
    puts "Введите номер станции, которую делаете стартовой в маршруте"
    start_station = select_from_collection(@stations)
    puts "Введите номер станции, которую делаете конечной в маршруте"
    finish_station = select_from_collection(@stations)
    return if start_station.nil? || finish_station.nil?
    return if start_station == finish_station
    @routes << Route.new(start_station, finish_station)
  end

  def add_station_to_route
    show_stations(@stations)
    puts "Введите номер станции, которую добавляете в маршрут"
    station_to_add = select_from_collection(@stations)

    show_routes(@routes)
    puts "Введите номер маршрута, в который добавляете станцию"
    selected_route = select_from_collection(@routes)
    return if station_to_add.nil? || selected_route.nil?
    return if selected_route.stations.include? station_to_add
    
    selected_route.add_station(station_to_add)
  end

  def delete_station_from_route
    show_routes(@routes)
    puts "Введите номер маршрута, из которого убираете станцию"
    selected_route = select_from_collection(@routes)

    show_stations(selected_route.stations)
    puts "Введите номер станции, которую удаляете из маршрута"
    station_to_del = select_from_collection(selected_route.stations)    

    selected_route.delete_station(station_to_del.name)
  end
    
  def add_train_route
    show_trains(@trains)
    puts "Введите номер поезда, который добавляете в маршрут"
    selected_train = select_from_collection(@trains)

    show_routes(@routes)
    puts "Введите номер маршрута для поезда"
    selected_route = select_from_collection(@routes)
    
    selected_train.set_route(selected_route)  
  end
    
  def add_train_wagon
    show_trains(@trains)
    puts "Введите номер поезда, которому добавляете вагон"
    selected_train = select_from_collection(@trains)
    case selected_train
    when PassengerTrain then selected_train.add_wagon(PassengerWagon.new)
    when CargoTrain then selected_train.add_wagon(CargoWagon.new)
    end
  end

  def remove_train_wagon
    show_trains(@trains)
    puts "Введите номер поезда, который добавляете в маршрут"
    selected_train = select_from_collection(@trains)
    selected_train.remove_wagon
    puts selected_train.wagons.size
  end
   
  def move_train
    loop do
      show_trains(@trains)
      puts "Введите номер поезда, который будет перемещен"
      selected_train = select_from_collection(@trains)

      puts "1 - Вперед"
      puts "2 - Назад"
      puts "0 - прервать движение"
      direction = gets.to_i
      case direction
      when 1 then selected_train.move_ahead
      when 2 then selected_train.move_back
      when 0 then break
      end       
    end   
  end

  def check_station_trains
    show_stations(@stations)
    puts "Введите номер станции, чтобы проверить поезда на ней"
    selected_station = select_from_collection(@stations)

    puts "Поездов тут нет" if selected_station.trains.empty?

    puts selected_station.trains
  end

  def show_stations(collection)
    collection.each.with_index(1) do |item, index|
      puts "#{index} - #{item.name}"
    end
  end

  def show_trains(collection)
    collection.each.with_index(1) do |item, index|
      puts "#{index} - #{item.type} (#{item.number})"
    end
  end

  def show_routes(collection)
    collection.each.with_index(1) do |item, index|
      puts "#{index} - #{item.name}"
    end
  end

  def select_from_collection(collection)
    index = gets.to_i - 1
    return if index.negative?
    collection[index]
  end

end
