module MWS
  class QueryString < ::String
    class UriEncoder
      NO_ENCODE_CHARACTERS = /[A-Za-z0-9\-\_\.\~]/

      def encode(string)
        string.to_s.each_char.map{|char| char.match(NO_ENCODE_CHARACTERS) ? char : escape_char(char) }.join("")
      end

      private

      def escape_char(char)
        char.each_byte.map{|byte| "%#{byte.to_s(16).upcase}" }.join("")
      end
    end
  end
end
