class PostsController < ApplicationController
  
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :checking_of_equality, only: [:edit, :update, :destroy]
  before_action :authenticate_user!, :except => [:show, :index]
  
  def index
    @post = Post.order(id: :desc).page params[:page]
  end

  def show
    if user_signed_in?
      @comment = current_user.comments.new
    end
    @comments = @post.comments.order(id: :DESC)
  end

  def new
    @post = current_user.posts.new
    @post.post_type = params[:post_type]
    set_visitor_sessions params[:post_type]
  end

  def edit
    if @post.post_type == nil or @post.post_type == ""
      redirect_to root_path, notice: 'Something went wrong! You can not edit this news right now. Try later.'
    end
    set_visitor_sessions @post.post_type
  end

  def create
     if @post.update(post_params)
      redirect_to @post, notice: 'Link was successfully updated.'
    else
      render :edit
    end
  end

  def update
    byebug
  end

  def destroy
    @post.destroy 
    redirect_to posts_path, notice: 'Post was successfully destroyed.'
  end
  
  private
    def set_visitor_sessions param
      session[:post_type] = param
    end
    def set_post
      @post = Post.find_by(id: params[:id]) or render(:not_found, status: 404)
    end
    def post_params
      case params[:post][:post_type]
      when "Link"
        return params.require(:post).permit(:title, :post_type, :link_url, :user_id)
      when "Image"
        return params.require(:post).permit(:title, :post_type, :img_url, :user_id)
      when "Text"
        return params.require(:post).permit(:title, :post_type, :body_text, :user_id)
      else
        logger.debug "You gave me #{params[:post][:post_type]} -- I have no idea what to do with that."
        params[:post][:post_type] = nil
      end
    end
    def checking_of_equality
      redirect_back(fallback_location: root_path, notice: 'You are not the creator of this news!') unless @post.user == current_user
    end
end
