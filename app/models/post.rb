class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, as: :commentable
  has_many :likes, as: :likeable
  paginates_per(30)
  
  validates :link_url, presence_post: true, http_url: true
  validates :body_text, presence_post: true  
  validates :img_url, presence_post: true 
  before_save :validate_post
  
  def validate_post
    case self.post_type
    when "Link"
      return true
    when "Image"
    when "Text"
    else
      false
    end
  end
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