class Conclusion < ActiveRecord::Base
	belongs_to :persona
	has_many :localities
	validates :ayuda_id, :estado, :locality_id, :presence=>true
end
