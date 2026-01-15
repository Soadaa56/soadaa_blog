class AddDefaultCategoryToPosts < ActiveRecord::Migration[8.1]
  def change
    change_column_default :posts, :category, 2
  end
end
