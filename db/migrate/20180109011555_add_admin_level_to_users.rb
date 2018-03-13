class AddAdminLevelToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :admin_level, :integer
  end
end
