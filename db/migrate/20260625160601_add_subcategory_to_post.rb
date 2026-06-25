class AddSubcategoryToPost < ActiveRecord::Migration[8.1]
  def change
    add_column :posts, :subcategory, :integer
  end
end
