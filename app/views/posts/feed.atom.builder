atom_feed do |feed|
  feed.title "Soadaa's Blog"
  feed.updated @posts.first&.published_at

  @posts.each do |post|
    feed.entry post, url: post_url(post) do |entry|
      entry.title(post.title)
      entry.content(Commonmarker.to_html(post.body), type: "html")

      entry.author do |author|
        author.name("Soadaa")
      end
    end
  end
end
