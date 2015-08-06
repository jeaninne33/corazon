class CreateInstitutions < ActiveRecord::Migration
  def change
    create_table :institutions do |t|
      t.string :nombre

      t.timestamps null: false
    end
  end
end
