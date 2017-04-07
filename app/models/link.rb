class Link < ApplicationRecord
  paginates_per(30)
  
  belongs_to :user
  has_many :comments, as: :commentable
  has_many :likes, as: :likeable
  
  # accepts_nested_attributes_for :comments
  
  validates :url, presence: true, http_url: true
  validates :title, presence: true
  
  before_create :exists_link 
  
  scope :links_per_page, ->(page) {
    page = 1 if page.to_i.nil?
    # paginates_per(10)
    order(id: :desc).page page
  }
  
  # Перевірка на вмісткість посилання в бд
  # Якщо існує то відміняємо зберігання та вивидимо помилку 
  # якщо не існує то зберігаємо
  def exists_link 
    if Link.exists?(url: self[:url])
      errors.add(:url, "already exists!")
      throw :abort
    end
  end
end
