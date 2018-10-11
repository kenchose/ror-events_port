class RenameColumnLocationToState < ActiveRecord::Migration
  def change
    rename_column :users, :location, :state
  end
end
