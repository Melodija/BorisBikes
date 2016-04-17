require "van"

describe Van do
  let(:bike) { double(:bike) }
  it { expect(subject).to respond_to :cargo }
  it { expect(subject).to respond_to(:pick_up).with(1).argument }

  it "should begin empty" do
    expect(subject.cargo).to eq []
  end

  describe "#pick_up" do
    it "picks one thing up" do
      subject.pick_up bike
      expect(subject.cargo).to eq [bike]
    end

    it "picks up multiple things" do
      subject.pick_up [bike, bike, bike]
      expect(subject.cargo).to eq [bike, bike, bike]
    end
  end
end
