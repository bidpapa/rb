require './route.rb'

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
    if @speed == 0      
      @wagons_count += 1      
    end
  end

  def remove_wagon
    if @speed == 0 && @wagons_count > 0   
      @wagons_count -= 1      
    end
  end

  def set_route(route)
    @route = route       
  end

  def current_station
    @route.stations[@station_number]
  end

  def next_station
    @route.stations[@station_number + 1]
  end

  def previous_station
    @route.stations[@station_number - 1]
  end

  def move_ahead
    if @route.stations[@station_number + 1]
      @route.stations[@station_number].send_train(self)
      @route.stations[@station_number +1 ].add_train(self)
      @station_number += 1
    end
  end

  def move_back
    if @route.stations[@station_number - 1] && @station_number > 0
      @route.stations[@station_number].send_train(self)
      @route.stations[@station_number-1].add_train(self)
      @station_number -= 1
    end
  end
end
