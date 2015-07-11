class AddLocationAttributesToLocation < ActiveRecord::Migration
  def change
    add_column :locations, :latitude, :float
    add_column :locations, :longtitude, :float
  end
end
