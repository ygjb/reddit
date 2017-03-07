class CommentsController < ApplicationController
  before_action :authenticate_user!, only: [:create]
  
  def create
    @commentable  = find_commentable
    @comment = current_user.comments.new(comment_params)
    
    @comment.commentable_type = @commentable['commentable_type']
    @comment.commentable_id = @commentable['commentable_id']
    
    respond_to do |format|
      if @comment.save
        format.html { redirect_to @comment.link, notice: 'Comment was successfully created.' }
        format.js   { }
      else
        format.html { render :new }
      end
    end
  end
  
  def find_commentable
    commentable = {}
    params[:comment].each do |name, value|
      if (name =~ /(.+)_id$/) && name != "user_id"
        commentable['commentable_id'] = value
        commentable['commentable_type'] = $1.classify.constantize.name
      end
    end
    commentable
  end
  
  private
    def comment_params
      params.require(:comment).permit(:body)
    end
end
