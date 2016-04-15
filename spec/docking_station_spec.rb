require "docking_station"

describe DockingStation do
  it { expect(subject).to respond_to(:release_bike, :bikes, :capacity) }
  it { expect(subject).to respond_to(:dock).with(1).argument }

  let(:bike) { double(:bike, working?: true) }
  let(:broken_bike) { double(:broken_bike, working?: false) }

  describe "#release_bike" do
    it "returns a working bike" do
      subject.dock(bike)
      expect(subject.release_bike).to be_working
    end

    it "returns a bike that has been docked" do
      subject.dock(bike)
      expect(subject.release_bike).to eq bike
    end

    it "raises an error if the dock is empty" do
      expect { subject.release_bike }.to raise_error "No working bikes available"
    end

    it "raises an error if there are only broken bikes" do
      subject.dock broken_bike
      expect { subject.release_bike }.to raise_error "No working bikes available"
    end

    it "if not all bikes are broken, release the working bike" do
      subject.dock bike
      subject.dock broken_bike
      expect(subject.release_bike).to eq bike
    end

    it "removes the bike from the docking station" do
      subject.dock bike
      subject.release_bike
      expect(subject.bikes).not_to include bike
    end
  end

  describe "#capacity" do
  	it "returns DEFAULT_CAPACITY if no capacity is given when initializing" do
  		expect(subject.capacity).to eq DockingStation::DEFAULT_CAPACITY
    end
    it "returns given capacity if one is given when initializing" do
      stn = DockingStation.new 30
      expect(stn.capacity).to eq 30
    end
  end

  describe "#dock" do
    it "returns the docked bike" do
      expect(subject.dock bike).to eq [bike]
    end
    it "can store up to defined capacity" do
      subject.capacity.times { subject.dock bike }
      expect(subject.bikes.length).to eq subject.capacity
    end
    it "raises an error if the dock is full" do
      subject.capacity.times { subject.dock bike }
      expect {subject.dock bike }.to raise_error "Docking station is full"
    end
  end

  describe "#bikes" do
    it "returns an array" do
      subject.dock bike
      expect(subject.bikes).to be_an Array
    end
    it "returns the docked bikes" do
      subject.dock bike
      expect(subject.bikes).to eq [bike]
    end
  end
end
