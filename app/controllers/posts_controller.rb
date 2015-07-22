class PostsController < ApplicationController
  layout "application"
  def index
    @posts = Post.all
  end

  def show
    query = Time.new(params[:year], params[:month])
    @post = Post.where("strftime('%Y', posts.created_at) = ? AND strftime('%m', posts.created_at) = ? AND slug = ?", query.strftime('%Y'), query.strftime('%m'), params[:slug]).first
  end

  def edit
    query = Time.new(params[:year], params[:month])
    @post = Post.where("strftime('%Y', posts.created_at) = ? AND strftime('%m', posts.created_at) = ? AND slug = ?", query.strftime('%Y'), query.strftime('%m'), params[:slug]).first
  end

  def update
    query = Time.new(params[:year], params[:month])
    @post = Post.where("strftime('%Y', posts.created_at) = ? AND strftime('%m', posts.created_at) = ? AND slug = ?", query.strftime('%Y'), query.strftime('%m'), params[:slug]).first
    if @post.update_attributes(post_params)
      redirect_to action: "show", year: @post.created_at.strftime('%Y'),
        month: @post.created_at.strftime('%m'), slug: @post.slug
    else
      render "edit"
    end

  end

  def new

  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to action: "show", year: @post.created_at.strftime('%Y'),
        month: @post.created_at.strftime('%m'), slug: @post.slug
    else
      render "new"
    end
  end

  private
  def post_params
    params.require(:post).permit(:title, :text, :slug)
  end
end
