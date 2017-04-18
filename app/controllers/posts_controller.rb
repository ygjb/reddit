class PostsController < ApplicationController
  before_action :set_link, only: [:show, :edit, :update, :destroy]
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
  end

  def edit
  end

  def create
    # byebug 
    @post = current_user.posts.new(post_params)
    if @post.save
      redirect_to posts_url, notice: 'Link was successfully created.'
    else
      set_visitor_sessions params[:post][:post_type]
      render :new
    end
  end

  def update
    
  end

  def destroy
    
  end
  private
    def set_visitor_sessions param
      session[:post_type] = param
    end
    def set_link
      @post = Post.find_by(id: params[:id]) or render(:not_found, status: 404)
    end
    def post_params
      case params[:post][:post_type]
      when "Link"
        return params.require(:post).permit(:title, :type, :link_url, :user_id)
      when "Image"
        return params.require(:post).permit(:title, :type, :body_text, :user_id)
      when "Text"
        return params.require(:post).permit(:title, :type, :img_url, :user_id)
      else
        "You gave me #{params[:type]} -- I have no idea what to do with that."
      end
    end
    def checking_of_equality
      unless @post.user == current_user
        redirect_back(fallback_location: root_path, notice: 'You are not the creator of the news!')
      end
    end
end
