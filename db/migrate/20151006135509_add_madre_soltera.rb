class AddMadreSoltera < ActiveRecord::Migration
  def change
    add_column :personas, :madre_soltera, :string
  end
end
