class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit]

  def index
    @posts = Post.all.order(created_at: :desc).page(params[:page]).per(7)
  end

  def new
    # @post = PostsTag.new
    @form = PostsTag.new
  end

  def create
    # @post = PostsTag.new(posts_params)
    @form = PostsTag.new(posts_params)

    if @form.valid?
      @form.save
      return redirect_to posts_path
    else
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
    @form = PostsTag.new(post: @post)
  end

  def update
    @post = Post.find(params[:id])
    @form = PostsTag.new(posts_params, post: @post)
    if @form.valid?
      @form.update
      # return redirect_to posts_path
    else
      render :edit
    end
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
  end

  def search
    return nil if params[:input] == ""
    tag = Tag.where(['name LIKE ?',  "%#{params[:input]}%"])
    render json: {keyword: tag}
  end

  private

  def posts_params
    params.require(:post).permit(:title, :content, :date, :time_first, :time_end, :people, :name).merge(user_id: current_user.id)
  end
end
