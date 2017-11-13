class CreatePictures < ActiveRecord::Migration[5.1]
  def change
    create_table :pictures do |t|
    	t.string :picture_name,:null=>true,:limit=>100
    	t.references :imageable,polymorphic: true,index: true

      t.timestamps
    end
  end
end
