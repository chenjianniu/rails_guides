class CreateBooks < ActiveRecord::Migration[5.1]
  def change
    create_table :books do |t|
    	t.string :book_name,:null=>true,:limit=>100
    	t.string :book_description,:null=>true,:limit=>100
    	#t.references :authors,:foreign_key=>true
    	t.belongs_to :author,index: true

      t.timestamps
    end
  end
end
