require 'airport.rb'
require 'plane.rb'

describe Airport do
  plane = Plane.new

  describe "#land" do
    it "respond to #land" do
      #raise exception when stormy!
      #raise exception when full!
      expect(subject).to respond_to(:land).with(1).argument
    end

    it "landing confirmation" do
      #later i will raise an exception so that this doesn't happen
      # the method land won't even run if airport is full.
        allow(subject).to receive(:weather_check) {"balmy"}
      expect(subject.land(plane)).to eq("plane landed")
    end

    it "raise an error when the weather is stormy" do
      allow(subject).to receive(:weather_check) {"stormy"}
      expect {subject.land(plane)}.to raise_error("too inclement for landing!")
    end
  end

  describe "#takeoff" do
    it "responds to #takeoff" do
      #raise exception when stormy!
      expect(subject).to respond_to(:takeoff).with(1).argument
    end

    it "takeoff confirmation when weather is fine" do
      allow(subject).to receive(:weather_check) {"balmy"}
      expect(subject.takeoff(plane)).to eq("plane took off!")
    end

    it "raises an error when the weather is stormy" do
      allow(subject).to receive(:weather_check) {"stormy"}
      expect {subject.takeoff(plane)}.to raise_error("too inclement for flight!")
    end
  end

  describe "#weather" do
    it "responds to #weather method" do
      expect(subject).to respond_to(:weather_check)
    end

    it "returns the state of the new Weather class" do
      # insert a stub?
      # allow(die).to receive(:roll) { 3 }
      allow(subject).to receive(:weather_check) {"balmy"}
      expect(subject.weather_check).to eq("balmy")
    end

  end
end
