class DeleteAyuda < ActiveRecord::Migration
  def up 
    remove_column :conclusions, :ayuda_id
  end
  def down
    add_column :conclusions, :ayuda_id , :integer
  end

end
