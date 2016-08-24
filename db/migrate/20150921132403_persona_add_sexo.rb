class PersonaAddSexo < ActiveRecord::Migration
  def change
    add_column :personas, :sexo, :string
  end
end
