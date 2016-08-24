class AddLocalitiesToConclusions < ActiveRecord::Migration
  def change
    add_reference :conclusions, :locality, index: true
    add_foreign_key :conclusions, :localities
  end
end
