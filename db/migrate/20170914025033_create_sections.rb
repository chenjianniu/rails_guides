class CreateSections < ActiveRecord::Migration[5.1]
  def change
    create_table :sections do |t|
    	t.string :section_name,:null=>true,:limit=>100
    	t.belongs_to :document,foreign_key: true,index: true

      t.timestamps
    end
  end
end
