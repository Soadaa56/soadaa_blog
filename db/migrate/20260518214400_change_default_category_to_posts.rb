class ChangeDefaultCategoryToPosts < ActiveRecord::Migration[8.1]
  def change
    change_column_default :posts, :category, 0
  end
end
