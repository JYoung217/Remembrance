class FeedController < ApplicationController
	include ApplicationHelper
	def index
		current_user
		@posts = Post.order(:updated_at => :desc)
	end
end
