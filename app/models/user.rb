class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  #devise api
  acts_as_token_authenticatable
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,   :registerable, :confirmable,
         :recoverable, :rememberable, :trackable,  :validatable
         
  has_many :links
  has_many :comments
  
  #has_one :avatar, :class_name => "Image", :as => :imageable, :dependent => :destroy

  # def image_styles
  #   { :thumb => "50x50>",:medium => "150x150>" }
  # end
  
end
