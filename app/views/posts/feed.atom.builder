atom_feed do |feed|
  feed.id "tag:soadaa.xyz,2026:/feed"
  feed.title "Soadaa's Blog"
  feed.updated @posts.first&.published_at

  @posts.each do |post|
    feed.entry post, url: post_url(post) do |entry|
      entry.id "tag:soadaa.xyz,2026:Post/#{post.id}"
      entry.title(post.title)
      entry.published(post.created_at)
      entry.updated(post.updated_at)

      entry.content(Commonmarker.to_html(post.body), type: "html")

      entry.author do |author|
        author.name("Soadaa")
      end
    end
  end
end
