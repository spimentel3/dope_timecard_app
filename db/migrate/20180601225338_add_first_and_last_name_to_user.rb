class AddFirstAndLastNameToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :f_name, :string, default: ""
    add_column :users, :l_name, :string, default: ""
  end
end
