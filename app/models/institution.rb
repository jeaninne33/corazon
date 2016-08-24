class Institution < ActiveRecord::Base
   has_one :ayuda
   validates :nombre , uniqueness: true
   validates :nombre,  :presence =>true

   def self.search(search)
     where("nombre LIKE ? ", "%#{search}%" )
   end
end
