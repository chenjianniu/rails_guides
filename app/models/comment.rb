class Comment < ApplicationRecord
	
  belongs_to :article,touch: true
  validates :article,presence: true

	after_touch do |data|
		puts "you touch comment"
	end
end
