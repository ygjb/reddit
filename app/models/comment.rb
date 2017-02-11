class Comment < ApplicationRecord
  # paginates_per(15)
  
  belongs_to :link
  belongs_to :user
  
  validates :body, presence: true
end
