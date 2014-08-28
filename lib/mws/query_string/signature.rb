require "openssl"
require "base64"

module MWS
  class QueryString < ::String
    class Signature < ::String
      def initialize(text, key)
        bytes = OpenSSL::HMAC.digest("SHA256", key, text)
        signature = Base64.strict_encode64(bytes)

        super(signature)
      end
    end
  end
end
