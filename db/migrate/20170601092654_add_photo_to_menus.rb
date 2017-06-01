class AddPhotoToMenus < ActiveRecord::Migration[5.0]
  def change
    add_column :menus, :photo, :string
  end
end
