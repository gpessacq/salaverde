class Sala < ActiveRecord::Base
  validates :nombre, :apellido, :cumple, :email, presence: true
                 
  geocoded_by :lugar_festejo
  after_validation :geocode
  #, :if => lambda{ |obj| obj.lugar_festejo_changed? }                    
   #:if => lambda{ |obj| obj.address_changed? }
   #     :if => :lugar_festejo_changed?               
end
