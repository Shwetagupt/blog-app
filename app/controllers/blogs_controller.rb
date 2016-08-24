class BlogsController < ApplicationController
  before_action :set_blog, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @blogs = current_user.blogs.all
    respond_with(@blogs)
  end

  def list
    @blogs = Blog.where(:publish => true)
  end

  def show
    respond_with(@blog)
  end

  def new
    @blog = current_user.blogs.new
    respond_with(@blog)
  end

  def edit
  end

  def create
    @blog = current_user.blogs.new(blog_params)
    @blog.save
    respond_with(@blog)
  end

  def update
    @blog.update(blog_params)
    respond_with(@blog)
  end

  def destroy
    @blog.destroy
    respond_with(@blog)
  end

  private
    def set_blog
      @blog = Blog.find(params[:id])
    end

    def blog_params
      params.require(:blog).permit(:title, :body, :publish, :avatar)
    end
end
