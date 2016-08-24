class CreateLocalities < ActiveRecord::Migration
  def change
    create_table :localities do |t|
      t.string :municipio
      t.string :sector
      t.date :fecha
      t.boolean :activo

      t.timestamps null: false
    end
  end
end
