class AddNeedsToUpdateAccountToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :needs_to_update_account, :boolean, default: false
  end
end
