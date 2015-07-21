class Conclusion < ActiveRecord::Base
	belongs_to :persona
	has_many :ayudas
end
