class CargoTrain < Train
  def initialize(number)
    super(number, :cargo)
  end

  protected

  def attachable_wagon?(wagon)
    wagon.is_a?(CargoWagon)
  end
end
