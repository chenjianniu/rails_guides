class CreateDataLockViews < ActiveRecord::Migration[5.1]
  def change
    create_table :data_lock_views do |t|
    	t.string :name,:null=>true,:limit=>100,:collate=>"utf8_bin"
    	t.string :name_a,:null=>true,:limit=>100,:collate=>"utf8_bin"
    	t.string :name_b,:null=>true,:limit=>100,:collate=>"utf8_bin"
    	t.integer :lock_version
      t.integer :lock_version_same
    	
      t.timestamps
    end
  end
end
