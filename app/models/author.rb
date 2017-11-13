class Author < ApplicationRecord
	has_many :books,dependent: :destroy,:class_name=>"Book",:foreign_key=>"author_id"

	attr_readonly :count_of_books
end
