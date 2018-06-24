class Sala < ActiveRecord::Base
  geocoded_by :lugar_festejo
  after_validation :geocode

  validates :nombre,
            :apellido,
            :cumple,
            :email, presence: true, length: { maximum: 255 }
end
