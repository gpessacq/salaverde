class Sala < ActiveRecord::Base
  validates :nombre, :apellido, :cumple, :email, presence: true, length: { maximum: 255 }
  geocoded_by :lugar_festejo
  after_validation :geocode
end
