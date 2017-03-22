class LikesController < ApplicationController
  before_action :authenticate_user!, only: [:upvote, :downvote]
  before_action :like_exist, only: [:upvote,:downvote]
  
  def upvote
    if @like
      (@like.vote == 0 || @like.vote == -1) ? vote = 1 : vote = 0  
      update_like @like, vote 
    else
      like = puts_like_params
      like.vote = 1
      save_like like
    end
  end
  
  def downvote
    if @like
      (@like.vote == 0 || @like.vote == 1) ? vote = -1 : vote = 0    
      update_like @like, vote 
    else
      like = puts_like_params
      like.vote = -1
      save_like like
    end
  end
  
  private
    def like_exist
      @like = Like.find_by(likeable_id: params[:id], user_id: current_user.id)
    end
    
    def puts_like_params
      like = current_user.likes.create!
      like.likeable_type = params[:type].capitalize
      like.likeable_id = params[:id]
      like
    end
    
    def update_like like, vote
      respond_to do |format|
        if like.update(vote: vote)
          format.html { redirect_to root_path, notice: 'Like was successfully upvote.' }
          format.js   { }
        else
          format.html { render :new }
        end
      end
    end
    def save_like like
      respond_to do |format|
        if like.save
          format.html { redirect_to root_path, notice: 'Like was successfully created.' }
          format.js   { }
        else
          format.html { render :new }
        end
      end
    end
end
