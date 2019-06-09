require_relative 'station'
require_relative 'train'
require_relative 'route'
require_relative 'cargo_train'
require_relative 'passenger_train'
require_relative 'cargo_wagon'
require_relative 'passenger_wagon'

class RailRoad  

  def initialize
    @stations = []
    @trains = []
    @routes = []
    @start_finish_stations = []
  end

  def orders
    puts "Список команд: 1 - добавить станции, 2 - добавить поезда, 3 - создать маршрут
    4 - назначить поезду маршрут, 5 - добавить вагон поезду, 6 - перемещение поезда,
    7 - проверить поезда на станции, 8 - добавить станцию на маршрут, 9 - убрать станцию,
    10 - убрать вагон поезда, 11 - показать список станций"
    command = gets.to_i
    case command
    when 1
      self.add_stations
    when 2
      self.add_trains
    when 3
      self.add_route
    when 4
      self.add_train_route
    when 5
      self.add_train_wagon
    when 6
      self.move_train
    when 7
      self.check_station_trains
    when 8
      self.add_station_to_route
    when 9
      self.delete_station_from_route
    when 10
      self.remove_train_wagon    
    when 11
      self.show_stations
    end
  end

  def add_stations
    loop do
      puts "Введите название станции или stop для завершения"
      station_name = gets.chomp  
      break if station_name == 'stop' 
      @stations.push(Station.new(station_name))  
    end
    self.orders
  end

  def add_trains
    loop do
      puts "Введите тип создаваемого поезда (passenger/cargo) или stop для завершения"
      train_type = gets.chomp  
      break if train_type == 'stop'
      puts "Введите номер поезда"
      train_number = gets.to_i
      @trains.push(CargoTrain.new(train_number)) if train_type == 'cargo'
      @trains.push(PassengerTrain.new(train_number)) if train_type == 'passenger'
    end
    self.orders
  end

  def add_route
    puts "Введите начальную станцию маршрута"
    station_start = gets.chomp
    @stations.each do |station| 
      @start_finish_stations.push(station) if station.name == station_start
    end
    puts "Введите конечную станцию маршрута"
    station_end = gets.chomp
    @stations.each do |station| 
      @start_finish_stations.push(station) if station.name == station_end
    end
    @routes.push(Route.new(@start_finish_stations[0], @start_finish_stations[1]))
    self.orders
  end

  def add_station_to_route
    puts "Введите название станции"
    station_name = gets.chomp
    puts "Введите номер маршрута"
    route_number = gets.to_i
    @stations.each do |station| 
      @routes[route_number - 1].add_station(station) if station.name == station_name
    end
    self.orders
  end

  def delete_station_from_route
    puts "Введите название станции"
    station_name = gets.chomp
    puts "Введите номер маршрута"
    route_number = gets.to_i
    @stations.each do |station| 
      @routes[route_number - 1].delete_station(station) if station.name == station_name
    end
    self.orders
  end
    
  def add_train_route
    puts "Введите номер поезда, которому надо назначить маршрут"
    train_number = gets.to_i
    puts "Введите номер маршрута для выбранного поезда"
    route_number = gets.to_i

    @trains.each do |train| 
      train.set_route(@routes[route_number - 1]) if train.number == train_number
    end
    self.orders
  end
    
  def add_train_wagon
    puts "Введите номер поезда, которому надо добавить вагон"
    train_number = gets.to_i

    @trains.each do |train|
      if train.number == train_number
        wagon_type = CargoWagon.new if train.type == 'cargo'
        wagon_type = PassengerWagon.new if train.type == 'passenger'
        train.add_wagon(wagon_type)
        puts train.wagons.size
      end
    end
    self.orders
  end

  def remove_train_wagon
    puts "Введите номер поезда, которому надо убрать вагон"
    train_number = gets.to_i 

    @trains.each do |train|
      train.remove_wagon if train.number == train_number
      puts train.wagons.size
      end
    self.orders
  end
   
  def move_train
    loop do
      puts "Введите ahead для движения вперед. Введите back для движения назад. stop - завершить"
      direction = gets.chomp
      break if direction == 'stop' 
      puts "Введите номер поезда, который надо переместить"
      train_number = gets.to_i

      @trains.each do |train| 
        if train.number == train_number
          train.move_ahead if direction == 'ahead'
          train.move_back if direction == 'back'
        end
      end
    end
    self.orders
  end

  def check_station_trains
    puts "Введите название станции, чтобы проверить поезда на ней"
    station_name = gets.chomp

    @stations.each do |station| 
      puts station.trains if station.name == station_name
    end
    self.orders
  end

  def show_stations
    @stations.each {|station| puts station.name}    
  end

end
