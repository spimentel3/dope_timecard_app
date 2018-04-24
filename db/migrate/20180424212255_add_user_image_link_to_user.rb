class AddUserImageLinkToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :user_image_link, :string, default: ""
  end
end
