# encoding: UTF-8

class String
  # Helper function to count the character length by first converting to an
  # array.  This is needed because with unicode strings, the return value
  # of length may be incorrect
  def char_length
    if respond_to? :codepoints
      length
    else
      chars.kind_of?(Enumerable) ? chars.to_a.size : chars.size
    end
  end

  # Helper function to convert this string into an array of unicode characters.
  def to_char_a
    @to_char_a ||= if chars.kind_of?(Enumerable)
                     chars.to_a
                   else
                     char_array = []
                     0.upto(char_length - 1) { |i| char_array << [chars.slice(i)].pack('U') }
                     char_array
                   end
  end
end

# Helper functions to return character offsets instead of byte offsets.
class MatchData
  def char_begin(n)
    if string.respond_to? :codepoints
      self.begin(n)
    else
      string[0, self.begin(n)].char_length
    end
  end

  def char_end(n)
    if string.respond_to? :codepoints
      self.end(n)
    else
      string[0, self.end(n)].char_length
    end
  end
end


module Gitcussion
  module UsernameExtractor
    extend self

    def parse(text)
      return [] unless text =~ /[@＠]/
      possible_entries = []
      text.to_s.scan(Gitcussion::Regex[:valid_mention_or_list]) do |before, at, screen_name, list_slug|
        match_data = $~
        after = $'
        unless after =~ Gitcussion::Regex[:end_mention_match]
          start_position = match_data.char_begin(3) - 1
          end_position = match_data.char_end(list_slug.nil? ? 3 : 4)
          possible_entries << {
              :screen_name => screen_name,
              :list_slug => list_slug || "",
              :indices => [start_position, end_position]
          }
        end
      end
      # Just returns usernames
      possible_entries.map { |m| m[:screen_name] }
    end


  end
end