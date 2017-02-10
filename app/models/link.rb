class Link < ApplicationRecord
  paginates_per(30)
  
  belongs_to :user
  has_many :comments
  
  validates :url, presence: true, http_url: true
  validates :title, presence: true
  
  scope :links_per_page, ->(page) {
    page = 1 if page.to_i.nil?
    paginates_per(10)
    order(id: :desc).page page
  }
  
  include ActiveRecordExtension
end
