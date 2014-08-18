class CreateInvites < ActiveRecord::Migration
  def change
    create_table :invites do |t|
    	t.string 	:email
    	t.integer :memorial_id
      t.timestamps
    end
    add_index :invites, :email
  end
end
