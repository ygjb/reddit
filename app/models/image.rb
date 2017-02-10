class Image < ApplicationRecord
  belongs_to :imageable, polymorphic: true
    # Paperclip
  has_attached_file :image,
    :styles => Proc.new {|a| a.instance.imageable.image_styles}
  
  validates_attachment_content_type :image, :content_type => 'image/jpeg'
end
