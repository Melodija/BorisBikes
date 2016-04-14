class Garage
  attr_reader :bikes

  def initialize
    @bikes = []
  end

  def accept_bikes(bike_arr)
  #  raise "please leave your bike in the array at the door" unless bike_arr.class == Array
    bike_arr.each do |bike|
      bike.fix_bike
      @bikes << bike
    end
  end

  def release_bikes
    @bikes.pop(@bikes.size)
  end
end
