# natcmp.rb (http://rubyforge.org/projects/natcmp/)
# Version 1.3
#
# Natural order comparison of two strings
# e.g. "my_prog_v1.1.0" < "my_prog_v1.2.0" < "my_prog_v1.10.0"
# which does not follow alphabetically
#
# Based on Martin Pool's "Natural Order String Comparison" originally written in C
# http://sourcefrog.net/projects/natsort/
#
# This implementation is Copyright (C) 2003, 2008 by Alan Davies
# <cs96and_AT_yahoo_DOT_co_DOT_uk>
#
# This software is provided 'as-is', without any express or implied
# warranty.  In no event will the authors be held liable for any damages
# arising from the use of this software.
#
# Permission is granted to anyone to use this software for any purpose,
# including commercial applications, and to alter it and redistribute it
# freely, subject to the following restrictions:
#
# 1. The origin of this software must not be misrepresented; you must not
#    claim that you wrote the original software. If you use this software
#    in a product, an acknowledgment in the product documentation would be
#    appreciated but is not required.
# 2. Altered source versions must be plainly marked as such, and must not be
#    misrepresented as being the original software.
# 3. This notice may not be removed or altered from any source distribution.
class String

  # 'Natural order' comparison of two strings
  def self.natcmp(str1, str2, options = {})
    case_sensitive = options[:case_sensitive] || false
    
    min = lambda { |a, b| a < b ? a : b }

    # Split the strings into digits and non-digits
    strings = [str1, str2].inject(Array.new) do |arr, str|
      str = str.downcase unless case_sensitive
      arr << str.tr(" \t\r\n", '').split(/(\d+)/)
    end

    # Loop through all the digit parts and convert to integers if neither of them begin with a zero
    1.step(min.call(strings[0].size, strings[1].size) - 1, 2) do |idx|
      if (strings[0][idx] !~ /^0/) and (strings[1][idx] !~ /^0/)
        strings.each { |arr| arr[idx] = arr[idx].to_i }
      end
    end

    strings[0] <=> strings[1]
  end

end
