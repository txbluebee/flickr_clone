class AddJoinTable < ActiveRecord::Migration[5.1]
  def change
    create_table :images_tags do |t|
      t.references :image, foreign_key: true
      t.references :tag, foreign_key: true
      t.timestamps
    end
    remove_column :tags, :image_id, :integer  
  end
end
