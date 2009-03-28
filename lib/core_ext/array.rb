class Array

  # Method which sort an array composed of strings with embedded numbers by
  # the 'natural' representation of numbers inside a string.
  def sort_natural(case_sensitive = false)
  
    reg_number = /\d+/
  
    # We call the sort method of the Array class.
    self.sort do |str1, str2|
      
      str1, str2 = str1.dup, str2.dup
      
      unless str1.is_a? String
        str1 = str1.to_s
      end
      unless str2.is_a? String
        str2 = str2.to_s
      end
      
      
      unless case_sensitive
        str1.downcase!
        str2.downcase!
      end
  
      # We try to find an embedded number
      a = str1.match(reg_number)
      b = str2.match(reg_number)
  
      # If there is no number
      if [a,b].include? nil
        str1 <=> str2
      else
        while true
          begin
            # We compare strings before the number. If there
            # are equal, we will have to compare the numbers
            if (comp = a.pre_match <=> b.pre_match) == 0
              # If the numbers are equal
              comp = (a[0] == b[0]) ? comp = a[0] + a.post_match <=> b[0] + b.post_match :
                                      comp = a[0].to_i <=> b[0].to_i
            end
  
            str1, str2 = a.post_match, b.post_match
            a = str1.match(reg_number)
            b = str2.match(reg_number)
          rescue
            break
          end
        end
        comp
      end
    end
  end
  
  # Same as 'sort_natural' but replace in place.
  def sort_natural!
    self.replace(sort_natural)
  end

end