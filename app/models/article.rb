#encoding:utf-8
class Article < ApplicationRecord
	has_many :comments,dependent: :destroy,inverse_of: :article
	#validates :title,presence: {message: "%{model} see %{value} see %{attribute}"},length:{minimum: 5}
	validates_associated :comments

	#validates :text,numericality: true
  #validates :text_confirmation, presence: true

	before_validation :before_save
	after_validation :after_save

	after_find :after_find_method,if: :after_find_if
	# after_find do |data|
	# 	puts "after_find doing"
	# end


	after_rollback do |data|
		#raise "callback有问题"
	end
	
	# after_save do |data|
	# 	binding.pry
	# 	raise "after有问题"
	# end

	after_commit do |data|
		raise "commit有问题"
	end


	after_initialize do |data|
		puts "after_initialize doing"
	end

	after_touch do |data|
		puts 'you already touch article'
	end

	scope :artilce_title,->(title_value){
		where(:title=>title_value)
	}

	# default_scope{
	# 	#where(:title=>"1")
	# }

	scope :method_1,->{
		where(:title=>"2")
	}

	scope :method_3,->{
		where(:title=>"2")
	}

	enum title: [:sure, :unsure]

	def title
		"I am #{super}"
	end

	private
		def after_find_if
			puts "after_find_if doing"
			return true
		end
		def after_find_method
			puts "after_find doing"
			# ActiveSupport.halt_callback_chains_on_return_false = false
			# throw(:abort)
		end
		def before_save
			puts "before_save"
		end
		def after_save
			puts "after_save"
		end
end
