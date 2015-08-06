class AddInstitutionToAyudas < ActiveRecord::Migration
  def change
    add_reference :ayudas, :institution, index: true
    add_foreign_key :ayudas, :institutions
  end
end
