class Book < ApplicationRecord
	belongs_to :author,-> {where author_mobile: "11"},counter_cache: :count_of_books
end
