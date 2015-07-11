require 'rails_helper'

RSpec.describe Location, :type => :model do
  describe "location creation" do
    before(:each) do
      @location = FactoryGirl.create(:location)
    end

    it "Should be successfully created" do
      expect(@location.country.present?).to eq(true)
      expect(@location.country).to eq("France")

      expect(@location.city.present?).to eq(true)
      expect(@location.city).to eq("Paris")
    end

  end
end