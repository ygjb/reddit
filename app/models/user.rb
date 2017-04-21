class User < ApplicationRecord
  acts_as_token_authenticatable
  
  devise :database_authenticatable, :registerable, :confirmable, 
         :recoverable, :rememberable, :trackable,  :validatable
       
  has_many :posts, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy
end
