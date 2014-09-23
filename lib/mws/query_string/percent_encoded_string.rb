require "uri_encoding"

module MWS
  class QueryString < ::String
    class PercentEncodedString < ::String
      def initialize(string)
        encoded_string = UriEncoding.encode(string, UriEncoding::UnreservedCharacters)
        super(encoded_string)
      end
    end
  end
end
