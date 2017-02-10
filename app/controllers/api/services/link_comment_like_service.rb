class LinkCommentLikeService
  attr_accessor :link,:like,:comments
  def initialize(link)
    @link = link
    @comment = @link.comments.to_hash
  end
  def link_with_comment_and_like
    
    #@like = @link.likes
  end
  def to_hash
    
  end
end