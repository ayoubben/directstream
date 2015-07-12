class Location < ActiveRecord::Base

  validates :city, presence: true
  validates :country, presence: true

  scope :unconverted, -> { where(latitude: nil, longtitude: nil) }
  scope :converted, -> { where("latitude IS NOT NULL AND longtitude IS NOT NULL") }

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

  def self.search(search_country, search_city)
    if search_country && search_city
      self.where("country like ? AND city like ?", "%#{search_country}%","%#{search_city}%")
    elsif search_country || search_city
      self.where("country like ? OR city like ?", "%#{search_country}%","%#{search_city}%")
    else
      self.all
    end
  end
end
