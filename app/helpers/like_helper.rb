module LikeHelper
  def all_like likes
    # byebug
    count_like = 0
    likes.each do |like|
      count_like += like.vote
    end
    count_like
  end
  def active_like link
    if link.likes.liked_by? current_user
      '%span(class="octicon octicon-chevron-up")'
    end
  end
end