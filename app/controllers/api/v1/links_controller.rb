class Api::V1::LinksController < Api::BaseApiController
  
  before_action :set_link, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user_with_token!, only: [:create]
  
  def index
    @links = Link.links_per_page(params[:page])
    if !@links.blank?
      render json: { :links => @links}, status: 200
    else
      render json: @links.errors, status: :unprocessable_entity
    end
  end
  
  def show
    if @link.present?
      # @link = @link.to_hash
      render json: @link, include: ['comments'], status: 200
    else
      render json: { :error => "page not found" }, status: 404
    end
  end
  
  def create
    @link = current_user.links.new(link_params)
    if @link.save
      render json: @link, status: 201 
    else
      render json: @link.errors, status: :unprocessable_entity
    end
  end
  
   private
    def set_link
      @link = Link.find_by(id: params[:id])
    end
    def link_params
      params.require(:link).permit(:title, :url)
    end
end