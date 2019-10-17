class AddDefaultImgUrlToUser < ActiveRecord::Migration[6.0]
  def change
    change_column_default(:users, :img_url, "https://www.pinclipart.com/picdir/middle/8-82428_profile-clipart-generic-user-gender-neutral-head-icon.png")
  end
end
