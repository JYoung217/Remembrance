class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.integer :author_id
      t.integer :memorial_id
      t.boolean :approved
      t.string :text

      t.timestamps
    end
  end
end
