class Photo < ActiveRecord::Base
  include ApplicationHelper
  has_many :comments, as: :commentable
  belongs_to :uploader, class_name: User
  belongs_to :memorial
  mount_uploader :url, PhotoUploader

  validates :caption, presence: true
end
