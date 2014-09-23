require "mws/query_string/percent_encoded_string"

module MWS
  class QueryString < ::String
    class RequestString < ::String
      def initialize(args)
        @method   = args[:method]
        @endpoint = args[:endpoint]
        @path     = args[:path]
        @params   = args[:params]

        super(request_string)
      end

      private

      def sorted_params
        Hash[@params.sort_by{|param| param[0] }]
      end

      def encoded_params
        Hash[sorted_params.map{|pair| pair.map{|elm| PercentEncodedString.new(elm.to_s) } } ]
      end

      def request_string
        [
          @method.to_s.upcase,
          @endpoint,
          @path,
          encoded_params.map{|pair| pair.join("=") }.join("&")
        ].join("\n")
      end
    end
  end
end
