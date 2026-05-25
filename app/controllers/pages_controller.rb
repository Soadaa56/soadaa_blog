class PagesController < ApplicationController
  def home
    @post = Post.last
    require 'commonmarker'
    @markdown = Commonmarker.to_html(@post.body).html_safe
  end

  def about; end

  def contact; end
end
