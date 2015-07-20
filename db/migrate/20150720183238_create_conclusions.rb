class CreateConclusions < ActiveRecord::Migration
  def change
    create_table :conclusions do |t|
      t.string :solicitud
      t.string :estado
      t.date :fecha
      t.integer :persona_id 
      t.integer :ayuda_id 
      t.timestamps null: false
    end
  end
end
