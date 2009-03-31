class Array
  
  def sort_natural(options = {})
    case_sensitive = options[:case_sensitive] || false
    
    self.sort { |x, y| String.natcmp(x, y, :case_sensitive => case_sensitive) }
  end
  
  def sort_natural!(options = {})
    self.replace(sort_natural(options))
  end
  
end