require "openssl"
require "base64"

module MWS
  class QueryString < ::String
    class Signatory
      def initialize(key)
        @key = key
      end

      def sign(text)
        bytes = OpenSSL::HMAC.digest("SHA256", @key, text)
        Base64.strict_encode64(bytes)
      end
    end
  end
end
