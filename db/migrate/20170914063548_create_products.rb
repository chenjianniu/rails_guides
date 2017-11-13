class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
    	t.string :product_name,:null=>true,:limit=>100
      t.timestamps
    end
  end
end
