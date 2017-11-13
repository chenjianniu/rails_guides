class ChangeColumnArticles < ActiveRecord::Migration[5.1]
  def up
  	change_column :articles,:title,:string,:limit=>100,:collate=>"utf8_bin",:default=>"",:comment=>"这是文章字段"
  end

  def down
  	change_column :articles,:title,:string,:limit=>155,:collate=>"utf8_bin"
  end
end
