class Station
  attr_reader :trains

  def initialize(name)
    @name = name
    @trains = []
    @types = []
  end

  def add_train(train)
    @trains.push(train)
  end

  def send_train(train)
    @trains.delete(train)
  end

  def train_types
    @trains.each do |train|
      @types << train.type
    end

    counts = Hash.new(0)
    @types.each { |type| counts[type] += 1 }

    puts counts
  end
end

class Route
  attr_reader :station

  def initialize(start, finish)
    @station = [start, finish]
  end

  def add_station(station)
    @station.insert(-2, station)
  end

  def delete_station(station)
    @station.delete(station)
  end
end

class Train
  attr_reader :speed
  attr_reader :wagons_count
  attr_reader :type

  def initialize(number, type, wagons_count)
    @number = number
    @type = type
    @wagons_count = wagons_count
  end

  def speed=(speed)
    @speed = speed
  end

  def stop
    @speed = 0
  end
    
  def manipulate_wagons(add = true)
    if @speed == 0
      if add
        @wagons_count += 1
      elsif wagons_count > 0
        @wagons_count -= 1
      end  
    end
  end

  def set_route(route)
    @route = route
    @station_number = 0
    @current_station = route.station[0]    
  end

  def move(ahead = true)
    if ahead && (@station_number + 1) != @route.station.length
      @station_number += 1
      @current_station = @route.station[@station_number]     
      @route.station[(@station_number-1)..(@station_number+1)]
    elsif !ahead && @station_number > 0
      @station_number -= 1
      @current_station = @route.station[@station_number]    
      if @station_number > 0
        @route.station[(@station_number-1)..(@station_number+1)]
      else
        @route.station[0..1]
      end
    else
      "Поезд дальше не идет"
    end
  end

end
