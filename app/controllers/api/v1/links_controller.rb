class Api::V1::LinksController < Api::BaseApiController
  
  before_action :set_link, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user_with_token!, only: [:create]
  
  def index
    @links = Link.links_per_page(params[:page])
    render json: {links: @links}, status: 200
  end
  def show
    render json: @link, :include => [:comments], :except => [:updated_at]
    # render :json => @link, :except => [:created_at, :updated_at]
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