class PostsController < ApplicationController
  http_basic_authenticate_with(
    name:     ENV.fetch("BLOG_ADMIN_USER", "admin"),
    password: ENV.fetch("BLOG_ADMIN_PASS", "password"),
    only:     %i[new create edit update destroy]
  )
  before_action :set_post, only: %i[ show edit update destroy ]

  # Atom/RSS feed
  def feed
    @posts = Post.published.order(created_at: :desc).limit(20)
    respond_to do |format|
      format.atom { render layout: false }
    end
  end

  # GET /posts or /posts.json
  def index
    if params[:category].present?
      @posts = Post.where(category: params[:category]).published.order(created_at: :desc).includes([ :cover_image_attachment ])
      if params[:subcategory].present?
        @posts = @posts.where(subcategory: params[:subcategory]).published.order(created_at: :desc).includes([ :cover_image_attachment ])
        @subcategory = params[:subcategory]
      end
      @category = params[:category]
    else
      @posts = Post.published.order(created_at: :desc).includes([ :cover_image_attachment ])
      @category = "All Posts"
    end
    @post_count = @posts.count
  end

  # GET /posts/1 or /posts/1.json
  def show
    require "commonmarker"
    @markdown = Commonmarker.to_html(@post.body, options:
      { parse: { smart: true, relaxed_autolinks: true }
      }).html_safe
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit; end

  # POST /posts or /posts.json
  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to @post, notice: "Post created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /posts/1 or /posts/1.json
  def update
    if @post.update(post_params)
      redirect_to @post, notice: "Post updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /posts/1 or /posts/1.json
  def destroy
    @post.destroy
    redirect_to posts_path, notice: "Post deleted."
  end

  private
    def set_post
      @post = Post.find_by!(slug: params[:id])
    end

    def post_params
      params.expect(post: [ :title, :body, :category, :subcategory, :cover_image, :published_at ])
    end
end
