class Persona < ActiveRecord::Base
	has_one :economy, dependent: :destroy
	has_many :conclusions, dependent: :destroy
	accepts_nested_attributes_for :economy
    accepts_nested_attributes_for :conclusions,
	 reject_if: proc { |attributes| attributes['solicitud'].blank? }, 
	 :allow_destroy => true


	
end
