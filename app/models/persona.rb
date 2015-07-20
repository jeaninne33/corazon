class Persona < ActiveRecord::Base
	has_one :economy 
	has_many :conclusions
	accepts_nested_attributes_for :economy, :conclusions
	
end
