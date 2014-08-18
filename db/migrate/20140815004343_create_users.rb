class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :provider
      t.string :uid
      t.string :name
      t.string :email_address
      t.string :oauth_token
      t.datetime :oauth_expires_at
      t.string :password_digest

      t.timestamps
    end
  end
end
