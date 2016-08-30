class Economy < ActiveRecord::Base
	belongs_to :persona

	  validates :adultos_mayores, :discapacitados, :cant_hijos, :presence=>true
end
