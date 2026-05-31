# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
Post.find_or_create_by(title: "First Post") do |post|
  post.body = "Hello and welcome to my site and my first post on my blog. This is more of a placeholder than anything else (kept in my db/seeds.rb file) but I also will keep the date consistent instead of using Time.now, so that I know the first day of my published blog!"
  post.category = "blog"
  post.slug = "first-post"
  post.published_at = Time.parse("2026-05-31 15:58:52")
end
