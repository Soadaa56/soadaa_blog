class MakeCategoryNonNullablePosts < ActiveRecord::Migration[8.1]
  def change
    change_column_null :posts, :category, false
  end
end
