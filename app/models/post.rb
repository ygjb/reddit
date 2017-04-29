class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, as: :commentable, dependent: :destroy
  has_many :likes, as: :likeable, dependent: :destroy
  
  has_attached_file :image, :styles => { :small => "70x70>" },
                  :url  => "/assets/posts/:id/:style/:basename.:extension",
                  :path => ":rails_root/public/assets/posts/:id/:style/:basename.:extension", 
                  presence_post: true

  # validates_attachment_presence :image
  validates_attachment_size :image, :less_than => 3.megabytes
  validates_attachment_content_type :image, :content_type => ['image/jpeg', 'image/png']
  
  
  
  
  validates :title, presence: true
  # validates :img_url, presence_post: true
  validates :body_text, presence_post: true  
  validates :link_url, presence_post: true, http_url: true
  
  paginates_per(30)
    # повертає відповідну сторінку до переданого номера сторінки
    # якщо параметр nill то повертає першу сторінку
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