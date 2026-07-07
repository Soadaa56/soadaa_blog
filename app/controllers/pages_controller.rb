class PagesController < ApplicationController
  allow_unauthenticated_access
  def home
    require "commonmarker"
    @post = Post.last
    @markdown = Commonmarker.to_html(@post.body).html_safe
  end

  def about; end

  def contact; end
end
