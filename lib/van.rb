class Van
  attr_reader :cargo

  def initialize
    @cargo =[]
  end

  def pick_up cargo
    @cargo << cargo
    @cargo.flatten!
  end

end
