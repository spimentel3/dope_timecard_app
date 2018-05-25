class CreateComanagers < ActiveRecord::Migration[5.1]
  def change
    create_table :comanagers do |t|
      t.integer :user_id
      t.integer :organization_id

      t.timestamps
    end
  end
end
