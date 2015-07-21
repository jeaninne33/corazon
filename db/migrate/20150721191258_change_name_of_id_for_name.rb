class ChangeNameOfIdForName < ActiveRecord::Migration
  def up
  	remove_column :conclusions, :solicitud
  	add_column :conclusions, :ayuda_id, :integer
  end
end
