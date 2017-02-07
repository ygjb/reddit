class LinksController < ApplicationController
  before_action :set_link, only: [:show, :edit, :update, :destroy]
  before_action :check_current_user?, only: [:update,:create, :edit, :destroy]
  
  def index
    @links = Link.order(:id).page params[:page]
  end

  def show
  end

  def new
    @link = current_user.links.new
  end

  def edit
  end

  def create
    @link = current_user.links.new(link_params)
    if @link.save
      redirect_to(fallback_location: @link, notice: 'Link was successfully created.')
      # redirect_to @link, notice: 'Link was successfully created.' 
    else
      render :new
    end
  end

  def update
    if @link.update(link_params)
      redirect_to @link, notice: 'Link was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @link.destroy
    redirect_to links_url, notice: 'Link was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_link
      @link = Link.find_by(id: params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def link_params
      params.require(:link).permit(:title, :url, :user_id)
    end
    
    def check_current_user?
      redirect_to links_path unless current_user
    end
end
