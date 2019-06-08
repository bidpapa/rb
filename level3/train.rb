class Train
  attr_reader :speed, :wagons_count, :type
  
  def initialize(number, type, wagons_count)
    @number = number
    @type = type
    @wagons_count = wagons_count
    @speed = 0
    @station_number = 0
  end  

  def speed(speed)
    @speed += speed
  end

  def stop
    @speed = 0
  end      

  def add_wagon
    @wagons_count += 1 if @speed == 0   
  end

  def remove_wagon
    @wagons_count -= 1 if @speed == 0 && @wagons_count > 0   
  end

  def set_route(route)
    @route = route
    @station_number = 0
    current_station.add_train(self)   
  end

  def current_station
    @route.stations[@station_number]
  end

  def next_station
    @route.stations[@station_number + 1]
  end

  def previous_station
    @route.stations[@station_number - 1] if @station_number > 0
  end

  def move_ahead
    return if next_station.nil?
    current_station.send_train(self)
    next_station.add_train(self)
    @station_number += 1
  end

  def move_back
    return if previous_station.nil?
    current_station.send_train(self)
    previous_station.add_train(self)
    @station_number -= 1
  end
end
