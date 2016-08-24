class AddMunicipioRefToPersonas < ActiveRecord::Migration
  def change
    add_reference :personas, :municipio, index: true
    add_foreign_key :personas, :municipios
  end
end
