class User < ActiveRecord::Base
	has_many :created_memorials, class_name: 'Memorial', foreign_key: :moderator_id
	has_many :memorial_guests, foreign_key: :guest_id
	has_many :attended_memorials, through: :memorial_guests, source: :memorial
	has_many :posts, foreign_key: :author_id
	has_many :photos, foreign_key: :uploader_id
	has_many :comments, foreign_key: :commenter_id
	has_secure_password

	before_save { self.email_address = email_address.downcase }
 	VALID_EMAIL_ADDRESS_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

	validates :name, presence: true
	validates :email_address, format: { with: VALID_EMAIL_ADDRESS_REGEX }, uniqueness: { case_sensitive: false }

	def self.from_omniauth(auth)
    where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.name
      user.email_address = auth.info.email
      user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      temp_pass = temp_password
      user.password = temp_pass
      user.password_confirmation = temp_pass
      user.save!
    end
  end

  private
  	def self.temp_password
  		(0...50).map { ('a'..'z').to_a[rand(26)] }.join
  	end
end
