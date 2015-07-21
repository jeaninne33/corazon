class Persona < ActiveRecord::Base
	has_one :economy, dependent: :destroy
	has_many :conclusions, dependent: :destroy
	accepts_nested_attributes_for :economy, :conclusions
	
end
