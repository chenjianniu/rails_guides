class CreateParagrahps < ActiveRecord::Migration[5.1]
  def change
    create_table :paragrahps do |t|
    	t.string :paragraph_name,:null=>true,:limit=>100
    	t.belongs_to :section,foreign_key: true,index: true

      t.timestamps
    end
  end
end
