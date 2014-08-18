class Comment < ActiveRecord::Base
	belongs_to :commentable, polymorphic: true
	belongs_to :commenter, class_name: User

	validates :commentable_type, inclusion: {in: %w(Post Photo), message: "%(value) is not a valid commentable class"}
end
