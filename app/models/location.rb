class Location < ActiveRecord::Base

  validates :city, presence: true
  validates :country, presence: true

  scope :unconverted, -> { where(latitude: nil, longtitude: nil) }

  def adress
  end

  def longtitude_decorate
    if self.longtitude.nil?
      return " - "
    else
      return self.longtitude
    end
  end

  def latitude_decorate
    if self.latitude.nil?
      return " - "
    else
      return self.latitude
    end
  end

  def complete_address
    "#{self.add_comma(self.number)} #{self.add_comma(self.street)} #{self.add_comma(self.city)} #{country}"
  end

  def add_comma(arg)
    if not arg.nil?
       "#{arg},"
    end
  end
end
