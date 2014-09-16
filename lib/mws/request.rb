require "base64"
require "digest/md5"
require "net/https"

module MWS
  class Request
    DEFAULT_METHOD = :post

    def initialize(args)
      @method   = args[:method] || DEFAULT_METHOD
      @path     = args[:path]
      @endpoint = args[:endpoint]
      @headers  = args[:headers] || {}
      @body     = args[:body]
    end

    def execute
      client = Net::HTTP.new(@endpoint, 443)
      client.use_ssl = true

      client.start do |https|
        case @method
        when :post then https.post(@path, @body, headers)
        else raise ArgumentError, "#{@method} is unknown HTTP method"
        end
      end
    end

    private

    def headers
      {
        "Contet-Type" => "text/xml",
        "Content-MD5" => Base64.encode64(Digest::MD5.digest(@body)),
        "User-Agent"  => "MarketplaceWebService/#{MWS::VERSION} (Language=Ruby)",
        "Host"        => @endpoint
      }.merge(@headers)
    end
  end
end
