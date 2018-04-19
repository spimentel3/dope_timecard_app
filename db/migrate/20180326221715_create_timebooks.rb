class CreateTimebooks < ActiveRecord::Migration[5.1]
  def change
    create_table :timebooks do |t|
      t.integer :organization_id
      t.integer :timecard_id
      t.integer :user_id

      t.timestamps
    end
  end
end
