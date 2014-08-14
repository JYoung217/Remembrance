class User < ActiveRecord::Base
	has_many :created_memorials, class_name: Memorial, foreign_key: :moderator_id
	has_many :memorial_guests, foreign_key: :guest_id
	has_many :attended_memorials, through: :memorial_guests, class_name: Memorial
	has_many :posts, foreign_key: :author_id
	has_many :photos, foreign_key: :uploader_id
	has_many :comments, foreign_key: :commenter_id

	before_save { self.email = email.downcase }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  VALID_PHONE_REGEX = /\A\(?([0-9]{3})\)?([ .-]?)([0-9]{3})\2([0-9]{4})\z/

	validates :name, presence: true
	validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
	validates :phone, presence: true, format: { with: VALID_PHONE_REGEX }, uniqueness: true
end