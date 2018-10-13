class AddDetailColumnToEvents < ActiveRecord::Migration
  def change
    add_column :events, :detail, :string
    add_column :events, :city, :string
    add_column :events, :state, :string
    remove_column :events, :location
  end
end
