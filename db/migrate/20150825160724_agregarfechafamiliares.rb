class Agregarfechafamiliares < ActiveRecord::Migration
  def change
  	add_column :personas, :fecha_nac, :date
  	add_column :families, :fecha_nac, :date
  end

  def down
  	remove_column :personas, :fecha_nac
  	remove_column :families, :fecha_nac

  end
end
