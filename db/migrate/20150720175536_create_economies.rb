class CreateEconomies < ActiveRecord::Migration
  def change
    create_table :economies do |t|
      t.string :sector
      t.string :empresa
      t.string :ingreso_familiar
      t.string :tipo_casa
      t.string :condiciones_de_vivienda
      t.string :persona_hab
      t.string :cant_hijos
      t.string :enceres_compartidos
      t.string :adultos_mayores
      t.string :discapacitados
      t.string :enfermos
      t.integer :persona_id 
      t.timestamps null: false
    end
  end
end
