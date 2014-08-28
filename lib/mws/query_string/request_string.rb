require "mws/query_string/uri_encoder"

module MWS
  class QueryString < ::String
    class RequestString < ::String
      DEFAULT_METHOD = "POST"
      DEFAULT_PATH   = "/"

      def initialize(args={})
        @method = args[:method] || DEFAULT_METHOD
        @host   = args[:host]
        @path   = args[:path] || DEFAULT_PATH
        @params = args[:params]

        super(request_string)
      end

      private

      def sorted_params
        Hash[@params.sort_by{|param| param[0] }]
      end

      def encoded_params
        encoder = MWS::QueryString::UriEncoder.new
        Hash[sorted_params.map{|pair| pair.map{|elm| encoder.encode(elm.to_s) } } ]
      end

      def request_string
        [
          @method.to_s.upcase,
          @host,
          @path,
          encoded_params.map{|pair| pair.join("=") }.join("&")
        ].join("\n")
      end
    end
  end
end
