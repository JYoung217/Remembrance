class MemorialGuest < ActiveRecord::Base
	belongs_to :guest, class_name: "User"
	belongs_to :memorial
end
