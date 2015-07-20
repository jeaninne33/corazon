class AddToEconomyPobrezaDescripcion < ActiveRecord::Migration
  def up
    add_column :economies , :pobreza_extrema , :boolean
    add_column :economies , :descripcion, :text
  end
  def down
    remove_column :economies ,:pobreza_extrema
    remove_column :economies ,:descripcion 
  end
end
