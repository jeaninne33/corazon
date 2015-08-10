class CreateFamilies < ActiveRecord::Migration
  def change
    create_table :families do |t|
      t.string :nombre
      t.string :apellido
      t.string :parentesco
      t.references :persona, index: true

      t.timestamps null: false
    end
    add_foreign_key :families, :personas
  end
end
