class Visitor < ApplicationRecord
	has_many :comments
	has_many :messages
	has_many :notifications, as: :notifiable
end
