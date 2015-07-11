class ConvertAdressJob < ActiveJob::Base
  queue_as :default

  def perform(*args)
    Location.unconverted.each do  |location|
      location.update_attribute(:longtitude, Geocoder.coordinates(location.complete_address)[0])
      location.update_attribute(:latitude,   Geocoder.coordinates(location.complete_address)[1])
    end


  end
end
