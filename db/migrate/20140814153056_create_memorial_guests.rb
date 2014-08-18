class CreateMemorialGuests < ActiveRecord::Migration
  def change
    create_table :memorial_guests do |t|
      t.integer :guest_id
      t.integer :memorial_id

      t.timestamps
    end
  end
end
