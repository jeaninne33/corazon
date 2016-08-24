class Conclusion < ActiveRecord::Base
	belongs_to :persona
	has_many :localities 
	validates :ayuda_id, :estado, :presence=>true
end
