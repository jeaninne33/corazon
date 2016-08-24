class EditParentesco < ActiveRecord::Migration
  def down
    delete_column :families, :parentesco, :string
  end
  def up
    add_column :families, :cedula, :string
  end
end
