require 'garage'

describe Garage do
  let(:bike) { double(:bike, working?: true, fix_bike: true) }
  let(:broken_bike) { double(:broken_bike, working?: false, fix_bike: false) }
  # let(:bike_broken_to_fixed) { double (:bike_broken_to_fixed, fix_bike: true)}

  it { is_expected.to respond_to(:bikes) }
  it { is_expected.to respond_to(:accept_bikes).with(1).argument}
  it { is_expected.to respond_to(:release_bikes)}

  it ": begins empty" do
    expect(subject.bikes.count).to eq 0
  end

  it ": should accept bikes into an array" do
    expect(subject.accept_bikes(bike)).to eq [bike]
  end

  it ": should accept multiple bikes and return them in an array" do
    subject.accept_bikes(bike)
    expect(subject.accept_bikes(bike)).to eq [bike, bike]
  end

  it "the accept_bike method calls fix_bike on the object that it is accepting" do
    expect(bike).to receive(:fix_bike)
    subject.accept_bikes(bike)
  end

  it "expects release bikes to return the array of bikes from the garage" do
    subject.accept_bikes(bike)
    subject.accept_bikes(bike)
    expect(subject.release_bikes).to eq [bike,bike]
  end

  it "expects the garage to be empty after releasing multiple bikes" do
    10.times {subject.accept_bikes(bike)}
    subject.release_bikes
    expect(subject.bikes).to eq []
  end

  it 'expects garage to accept an array of bikes' do
    expect(subject.accept_bikes([bike,bike])).to eq [bike,bike]
  end











end
