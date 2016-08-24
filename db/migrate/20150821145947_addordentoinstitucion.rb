class Addordentoinstitucion < ActiveRecord::Migration
  def change
  	add_column :institutions, :orden , :integer
  end
end
