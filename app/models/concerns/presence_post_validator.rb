class PresencePostValidator < ActiveModel::EachValidator
  
  def self.compliant?(value)
    
  end
  
  def validate_each(record, attribute, value)
    # unless value.present? && self.class.compliant?(record.)
      # record.errors.add(attribute, "something wrong! =( ")
    # end
  end

end