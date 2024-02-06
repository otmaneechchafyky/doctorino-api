class AddProfileImageToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :profile_image, :string, default: 'icons/user_icon.png'
    User.update_all(profile_image: 'icons/user_icon.png')
  end
end
