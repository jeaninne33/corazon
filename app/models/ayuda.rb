class Ayuda < ActiveRecord::Base
 belongs_to :institution

 validates :nombre , uniqueness: true
 validates :nombre, :institution_id, :presence =>true


 def self.search(search)
   where("nombre LIKE ? ", "%#{search}%" )
 end

end
