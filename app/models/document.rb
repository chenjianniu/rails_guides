class Document < ApplicationRecord
	has_many :sections,dependent: :destroy,:class_name=>"Section",:foreign_key=>"document_id"
	has_many :paragrahps,through: :sections
end
	