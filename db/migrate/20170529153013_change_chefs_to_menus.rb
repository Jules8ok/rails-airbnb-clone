class ChangeChefsToMenus < ActiveRecord::Migration[5.0]
  def change
    rename_table :chefs, :menus
  end
end
