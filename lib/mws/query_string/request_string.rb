require "mws/query_string/uri_encoder"

module MWS
  class QueryString < ::String
    class RequestString < ::String
      def initialize(args)
        @method = args[:method]
        @host   = args[:host]
        @path   = args[:path]
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
