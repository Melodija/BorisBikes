class Garage
  attr_reader :bikes

  def initialize
    @bikes = []
  end

  def accept_bikes(bike_arr)
    bike_arr.each do |bike|
      bike.fix_bike
      @bikes << bike
    end
  end

  def release_bikes
    @bikes.pop(@bikes.size)
  end
end
