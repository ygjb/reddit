class Api::V1::LinksController < Api::BaseApiController
  before_action :set_link, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user_with_token!, only: [:create]
  # TODO: 
  # create, update adn delete delete
  #
  def index
    @links = Link.links_per_page(params[:page])
    render_errors({:error_msg => "link id_#{params[:id]} not found", :status => 404}) unless @link
    render json: {links: @links.as_json(:except => [:updated_at])}, status: 200
  end
  def show
    render json: @link.as_json(include: {comments: { :except => [:updated_at] } }, :except => [:updated_at]) , status: 200
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
      render_errors({:error_msg => "missing params", :status => 400}) unless Integer(params[:id])
      @link = Link.find_by(id: params[:id])
      render_errors({:error_msg => "link id_#{params[:id]} not found", :status => 404}) unless @link
    end
    def link_params
      params.require(:link).permit(:title, :url)
    end
    def render_errors(options={})
      render json: {:error => options[:error_msg]},status: options[:status]
    end
end