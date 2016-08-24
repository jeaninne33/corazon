class AddLocalitiesToPersonas < ActiveRecord::Migration
  def change
    add_reference :personas, :locality, index: true
    add_foreign_key :personas, :localities
  end
end
