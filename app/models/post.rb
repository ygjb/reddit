<<<<<<< HEAD:app/models/post.rb
class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, as: :commentable
  has_many :likes, as: :likeable
  paginates_per(30)
  
  validates :link_url, presence: true, http_url: true
  validates :body_text, presence: true
  validates :img_url, presence: true
=======
class Link < ApplicationRecord
  attr_accessor :type
  paginates_per(30)
  
  belongs_to :user
  has_many :comments, as: :commentable
  has_many :likes, as: :likeable
  def self.type
    self.class.name
  end
  # accepts_nested_attributes_for :comments
  
  validates :url, presence: true, http_url: true
  validates :title, presence: true
>>>>>>> json_builder:app/models/link.rb
  
  before_create :exists_posts
  
  scope :posts_per_page, ->(page) {
    page = 1 if page.to_i.nil?
    # paginates_per(10)
    order(id: :desc).page page
  }
  
  # Перевірка на вмісткість посилання в бд
  # Якщо існує то відміняємо зберігання та вивидимо помилку 
  # якщо не існує то зберігаємо
  def exists_posts
    if Post.exists?(link_url: self[:link_url])
      errors.add(:link_url, "already exists!")
      throw :abort
    end
  end
end
