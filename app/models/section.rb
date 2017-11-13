class Section < ApplicationRecord
	belongs_to :document
	has_many :paragrahps,dependent: :destroy,:class_name=>"Paragrahp",:foreign_key=>"section_id"
end
