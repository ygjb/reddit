class LikesController < ApplicationController
  before_action :authenticate_user!, only: [:create]
  
  def create
    @like = Like.send(params[:method],params,current_user)
    # byebug
    # Like.likes_count params[:id]
    # @like_hash = {
    #   like_id: @like.likeble_id
    #   # like_id:
    # }
    respond_to do |format|
      if @like
        format.js   { }
      else
        format.html { render :root_path }
      end
    end
  end
end
