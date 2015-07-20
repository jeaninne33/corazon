class CreatePersonas < ActiveRecord::Migration
  def change
    create_table :personas do |t|
      t.string :nombre1
      t.string :nombre2
      t.string :apellido1
      t.string :apellido2
      t.string :cedula
      t.text :direccion
      t.text :referencia
      t.string :municipio
      t.string :parroquia
      t.string :telefono1
      t.string :telefono2

      t.timestamps null: false
    end
  end
end
