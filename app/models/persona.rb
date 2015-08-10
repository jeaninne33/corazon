class Persona < ActiveRecord::Base
	has_one :economy, dependent: :destroy
	has_many :conclusions, dependent: :destroy
	has_many :families, dependent: :destroy
	accepts_nested_attributes_for :economy
    accepts_nested_attributes_for :conclusions, reject_if: :all_blank ,	 :allow_destroy => true
    accepts_nested_attributes_for :families , reject_if: :all_blank , :allow_destroy => true
	validates :cedula , uniqueness: true

	
end
