module MWS
  class QueryString < ::String
    class UriEncoder
      NO_ENCODE_CHARACTERS = /[A-Za-z0-9\-\_\.\~]/

      def encode(string)
        string.each_char.map{|char| NO_ENCODE_CHARACTERS.match(char) ? char : escape_char(char) }.join("")
      end

      private

      def escape_char(char)
        char.each_byte.map{|byte| "%#{byte.to_s(16).upcase}" }.join("")
      end
    end
  end
end
