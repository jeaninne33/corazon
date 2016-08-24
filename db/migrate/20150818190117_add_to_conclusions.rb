class AddToConclusions < ActiveRecord::Migration
  def change
  	add_reference :conclusions, :ayuda, index: true
    add_foreign_key :conclusions, :ayudas
    #hay que estar pendiente de esto
  end
end
