class CreateDocuments < ActiveRecord::Migration[5.1]
  def change
    create_table :documents do |t|
    	t.string :documents_name,:null=>true,:limit=>100

      t.timestamps
    end
  end
end
