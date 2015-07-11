class AddColumnsToLocation < ActiveRecord::Migration
  def change
    add_column :locations, :street, :string
    add_column :locations, :number, :integer
    add_column :locations, :zip_code, :string
  end
end
