class Link < ApplicationRecord
  paginates_per(30)
  belongs_to :user
  validates :url, presence: true, http_url: true
  validates :title, presence: true
end
