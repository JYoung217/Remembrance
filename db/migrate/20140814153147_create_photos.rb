class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.integer :uploader_id
      t.integer :memorial_id
      t.boolean :approved
      t.string :url
      t.string :caption
      t.boolean :profile, default: false

      t.timestamps
    end
  end
end
