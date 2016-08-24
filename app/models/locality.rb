class Locality < ActiveRecord::Base
   validates :municipio, :sector, :fecha,  :presence =>true
   validates :municipio, uniqueness: {scope: [:municipio, :sector, :fecha], allow_blank: false, :message => "Error el registro ya existe"}


   def self.search(search)
     where("municipio LIKE ? or sector LIKE ? or fecha LIKE ?", "%#{search}%", "#{search}", "%#{search}%")
   end

end
