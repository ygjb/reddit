class LinksController < ApplicationController
  before_action :set_link, only: [:show, :edit, :update, :destroy]
  before_action :checking_of_equality, only: [:edit, :update, :destroy]
  before_action :authenticate_user!, :except => [:show, :index]
  
  def index
    @links = Link.order(id: :desc).page params[:page]
  end

  def show
    @comments = @link.comments.order(id: :DESC)
  end

  def new
    @link = current_user.links.new
  end

  def edit
    byebug
  end

  def create
    @link = current_user.links.new(link_params)
    if @link.save
      redirect_back(fallback_location: @link, notice: 'Link was successfully created.')
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
      @link = Link.find_by(id: params[:id]) or render(:not_found, status: 404)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def link_params
      params.require(:link).permit(:title, :url, :user_id)
    end
    
    def checking_of_equality
      unless @link.user == current_user
        redirect_back(fallback_location: root_path, notice: 'You are not the creator of the news!')
      end
    end
end
