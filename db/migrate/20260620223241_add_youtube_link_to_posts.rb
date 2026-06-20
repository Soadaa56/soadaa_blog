class AddYoutubeLinkToPosts < ActiveRecord::Migration[8.1]
  def change
    add_column :posts, :youtube_link, :string
  end
end
