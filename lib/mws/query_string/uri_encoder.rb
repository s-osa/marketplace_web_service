require "uri_encoding"

module MWS
  class QueryString < ::String
    class UriEncoder
      def encode(string)
        UriEncoding.encode(string, UriEncoding::UnreservedCharacters)
      end
    end
  end
end
