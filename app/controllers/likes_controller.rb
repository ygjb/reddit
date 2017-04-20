class LikesController < ApplicationController
  before_action :authenticate_user!, only: [:create]
  
  def create
    method = params[:method]
    respond_to do |format|
      if method == "upvote" or method == "downvote"
        @like = Like.send(params[:method],params,current_user)
        @count_like = Like.number_of_likes(@like.likeable_id)
      else
        @error_messages = "Missing method Upvote or Downvote. A sended method: #{method}"
      end
      format.js {}
    end
  end
end
