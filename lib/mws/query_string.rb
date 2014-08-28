require "mws/query_string/request_string"
require "mws/query_string/signature"
require "mws/query_string/uri_encoder"

module MWS
  class QueryString < ::String
    DEFAULT_METHOD = "POST"
    DEFAULT_PATH   = "/"
    DEFAULT_PARAMS = {
      "SignatureMethod" => "HmacSHA256",
      "SignatureVersion" => "2"
    }

    def initialize(args)
      @key    = args[:key]
      @method = args[:method] || DEFAULT_METHOD
      @host   = args[:host]
      @path   = args[:path] || DEFAULT_PATH
      @params = DEFAULT_PARAMS.merge(args[:params])

      @params["Timestamp"] = timestamp_string
      @params["Signature"] = signature_string # This substitution must be final substitution

      super(query_string)
    end

    private

    def query_string
      encoder = MWS::QueryString::UriEncoder.new
      sorted_params.each.map{|k, v| [k, encoder.encode(v)].join("=") }.join("&")
    end

    def timestamp_string
      (@params["Timestamp"].is_a?(Time) ? @params["Timestamp"] : Time.now).iso8601
    end

    def signature_string
      MWS::QueryString::Signature.new(request_string, @key)
    end

    def request_string
      MWS::QueryString::RequestString.new(@method, @host, @path, @params)
    end

    def sorted_params
      @params.sort_by{|k, _v| k }
    end
  end
end
