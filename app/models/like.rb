class Like < ApplicationRecord
  belongs_to :likeable, polymorphic: true
  belongs_to :user
  
  def self.puts_like_params(params, user)
    like = user.likes.create!
    like.likeable_type = params[:type].capitalize
    like.likeable_id = params[:id]
    like
  end
  
  scope :upvote, -> (params, user){
    @like = find_by(likeable_id: params[:id], user_id: user.id)
    if @like
      (@like.vote == 0 || @like.vote == -1) ? vote = 1 : vote = 0
      @like.update(vote: vote)
    else
      @like = puts_like_params(params, user)
      @like.vote = 1
      @like.save
    end
    @like
  }
  scope :downvote, -> (params, user){
    @like = find_by(likeable_id: params[:id], user_id: user.id)
    if @like
      (@like.vote == 0 || @like.vote == 1) ? vote = -1 : vote = 0    
      @like.update(vote: vote)
    else
      @like = puts_like_params(params, user)
      @like.vote = -1
      @like.save
    end
    @like 
  }
  
  scope :number_of_likes, ->(id){
    all_like = where(:likeable_id => id)
    vote_count = 0
    all_like.each do |like|
      vote_count += like.vote
    end
    vote_count
  }
end
