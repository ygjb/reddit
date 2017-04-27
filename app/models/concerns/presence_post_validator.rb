class PresencePostValidator < ActiveModel::EachValidator
  # Обов'язкова валідація полів 
  # в залежності від типу посту!
  def validate_specific_attributes(record,attribute,value)
    if attribute.present?
      if attribute == :body_text && record.post_type == "Text" || attribute == :link_url  && record.post_type == "Link" ||
        attribute == :img_url   && record.post_type == "Image"
        # дадавання повідомнення про помилку в разі відсутності обов'язкового поля! 
        record.errors.add(attribute, "can`t be blank!")  unless value.present?
        return false
      end
    end
    return true
  end
  
  def validate_each(record, attribute, value)
    
    unless record.post_type.present?
      record.errors.add(:post_type, "can`t be blank!") 
    end
    validate_specific_attributes(record,attribute,value)
  end
end