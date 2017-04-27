class Api::V1::PostsController < Api::BaseApiController
  before_action :set_post, only: [ :show ] #, :edit, :update, :destroy]
  before_action :authenticate_user_with_token!, only: [:create]
  
  def index
    @posts = Post.posts_per_page(params[:page])
    if @posts.exists?
      render json: { :posts => @posts}, status: 200
    else
      render json: @posts.errors, status: :unprocessable_entity
    end
  end
  
  def show
    if @posts.present?
      # @link = @link.to_hash
      render json: @posts, include: ['comments'], status: 200
    else
      render json: { :error => "page not found" }, status: 404
    end
  end
  
  def create
    
    # @posts = current_user.posts.new(posts_params)
    # if @posts.save
    #   render json: @posts, status: 201 
    # else
    #   render json: @posts.errors, status: :unprocessable_entity
    # end
  end
  
   private
    def set_post
      @posts = Post.find_by(id: params[:id])
    end
    # def link_params
    #   params.require(:link).permit(:title, :url)
    # end
end