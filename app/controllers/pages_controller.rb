class PagesController < ApplicationController
  def home
    @post = Post.last
  end

  def about; end

  def contact; end
end
