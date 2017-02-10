module  ActiveRecordExtension
  def to_hash
    link = get_attr(self)
    hash = { :link => link}
    
    return hash unless !self.comments.blank?
    
    comments = []
    self.comments.each do |comment|
      comments.push(data_with_relations comment)
    end
    
    hash.merge!({:comments => comments})
    
  end
  
  def data_with_relations mapped_model
    variable = {}
    mapped_model.attributes.each {|k,v| variable[k] = v}
  end
end