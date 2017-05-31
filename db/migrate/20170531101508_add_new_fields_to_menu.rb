class AddNewFieldsToMenu < ActiveRecord::Migration[5.0]
  def change
    add_column :menus, :latitude, :float
    add_column :menus, :longitude, :float
    add_column :menus, :address, :string
    add_reference :menus, :user, foreign_key: true
    add_column :menus, :pick_up, :datetime
  end
end
