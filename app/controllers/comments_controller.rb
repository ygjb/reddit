class CommentsController < ApplicationController
  before_action :authenticate_user!, only: [:create]
  def create
    @comment = current_user.comments.new(comment_params)
    respond_to do |format|
      if @comment.save
        format.html { redirect_to @comment.link, notice: 'Comment was successfully created.' }
        format.js   { }
      else
        format.html { render :new }
      end
    end
  end
  
  private
    def comment_params
      params.require(:comment).permit(:body,:user_id,:link_id)
    end
end
