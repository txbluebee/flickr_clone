class AddUserIdToImages < ActiveRecord::Migration[5.1]
  def change
    add_reference :images, :user, foreign_key: true
    drop_table :taggings
  end
end
