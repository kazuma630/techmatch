class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new]

  def index
    @posts = Post.all.order(created_at: :desc)
  end

  def new
    @post = PostsTag.new
  end

  def create
    @post = PostsTag.new(posts_params)
    if @post.valid?
      @post.save
      return redirect_to root_path
    else
      render :new
    end
  end

  def search
    return nil if params[:input] == ""
    tag = Tag.where(['name LIKE ?',  "%#{params[:input]}%"])
    render json: {keyword: tag}
  end

  private

  def posts_params
    params.require(:posts_tag).permit(:title, :content, :date, :time_first, :time_end, :people, :name).merge(user_id: current_user.id)
  end
end
