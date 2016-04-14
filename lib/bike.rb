class Bike
  attr_reader :working

  def initialize
    @working = true
  end

 def working?
    @working
 end

 def report_broken
   @working = false
 end

 def fix_bike
   @working = true
 end


end
