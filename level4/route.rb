class Route
  attr_reader :stations

  def initialize(start, finish)
    @stations = [start, finish]
  end

  def name
    [stations.first.name, stations.last.name].join(' - ')
  end

  def add_station(station)
    @stations.insert(-2, station)
  end

  def delete_station(station)
    return if [stations.first, stations.last].include?(station)
    @stations.delete(station)
  end
end
