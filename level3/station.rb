require './train.rb'

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

  def train_type(type)
    number = 0
    @trains.select.with_index(1) do |train, index| 
      number = index if train.type == type      
    end
    puts number
  end
end
