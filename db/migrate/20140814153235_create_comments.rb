class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :commenter_id
      t.integer :commentable_id
      t.string :commentable_type
      t.text :text

      t.timestamps
    end
  end
end
