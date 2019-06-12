class Train
  attr_reader :speed, :type, :number, :wagons
  
  def initialize(number, type)    
    @number = number
    @speed = 0
    @station_number = 0
    @wagons = []
    @type = type
  end

  def speed(speed)
    @speed += speed
  end

  def stop
    @speed = 0
  end      

  def add_wagon(wagon)
    @wagons.push(wagon) if @speed == 0 && wagon.wagon_type == @type
  end

  def remove_wagon
    @wagons.slice!(-1) if @speed == 0 && @wagons.size > 0   
  end

  def set_route(route)
    @route = route
    @station_number = 0
    current_station.add_train(self)   
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

  private

  def current_station #метод используется только внутри класса
    @route.stations[@station_number]
  end

  def next_station #метод используется только внутри класса
    @route.stations[@station_number + 1]
  end

  def previous_station #метод используется только внутри класса
    @route.stations[@station_number - 1] if @station_number > 0
  end  
end
