class AlgoNoHaceNada < ActiveRecord::Migration
  def up

  end
  def down
  	remove_column :conclusions, :solicitud
    remove_column :conclusions, :ayudas_id
  end
end
