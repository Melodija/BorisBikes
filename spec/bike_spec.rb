require 'bike'

describe Bike do
  it { is_expected.to respond_to :working?}
  it { is_expected.to respond_to :report_broken}
  it { is_expected.to respond_to :fix_bike}

  it ': has an instance variable "working" which is true for a new Bike' do
    expect(subject.working).to eq true
  end

  it ': report broken returns false for a broken bike' do
    expect(subject.report_broken).to eq false
  end

  it ': working attribute set to false for a broken bike' do
    subject.report_broken
    expect(subject.working).to eq false
    expect(subject.working?).to eq false
  end

  it "fix_bike will set the 'working' attribute to true of a broken bike" do
    subject.report_broken
    subject.fix_bike
    expect(subject).to be_working
  end






end
