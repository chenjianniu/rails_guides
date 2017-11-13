class CreateAuthors < ActiveRecord::Migration[5.1]
  def change
    create_table :authors do |t|
    	t.string :author_name,:null=>true,:limit=>100
    	t.string :author_mobile,:null=>true,:limit=>100
    	t.integer  :count_of_books

      t.timestamps
    end
  end
end
