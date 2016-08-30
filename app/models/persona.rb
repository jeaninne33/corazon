class Persona < ActiveRecord::Base
	has_one :economy, dependent: :destroy
	has_many :conclusions, dependent: :destroy
	has_many :families, dependent: :destroy
	belongs_to :locality
	accepts_nested_attributes_for :economy
  accepts_nested_attributes_for :conclusions, reject_if: :all_blank ,	 :allow_destroy => true
  accepts_nested_attributes_for :families , reject_if: :all_blank , :allow_destroy => true
	validates :cedula , uniqueness: true
	validates :nombre1, :apellido1, :sexo, :direccion,:cedula, :presence=>true
	validates_presence_of :locality_id, :message=> "Debe seleccionar la fecha, el municipio y el sector"



def self.cedula(id)
	where(:id=>id)
end

def self.search(search)
  where("nombre1 LIKE ? or apellido1 LIKE ? or cedula LIKE ? or (concat(nombre1,' ',apellido1) LIKE ?)", "%#{search}%", "#{search}", "%#{search}%","%#{search}%" )
end
end
