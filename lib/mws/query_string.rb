require "time"
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
      @key      = args[:key]
      @method   = args[:method] || DEFAULT_METHOD
      @endpoint = args[:endpoint]
      @path     = args[:path] || DEFAULT_PATH
      @params   = DEFAULT_PARAMS.merge(args[:params])

      @params["Timestamp"] = timestamp_string
      @params["Signature"] = signature_string # This substitution must be final substitution

      super(query_string)
    end

    private

    def query_string
      encoder = MWS::QueryString::UriEncoder.new
      sorted_params.each.map{|k, v| [k, encoder.encode(v)].join("=") }.join("&")
    end

    def sorted_params
      expanded_params.sort_by{|k, _v| k }
    end

    def expanded_params
      params = {}
      @params.each do |key, value|
        if Array === value
          value.each.with_index(1) do |v, idx|
            element_name = key.match(/([A-Z][a-z]+)List/)[1]
            new_key = [key, element_name, idx.to_s].join(".")
            params[new_key] = v
          end
        else
          params[key] = value
        end
      end
      params
    end

    def timestamp_string
      (@params["Timestamp"].is_a?(Time) ? @params["Timestamp"] : Time.now).getutc.iso8601
    end

    def signature_string
      MWS::QueryString::Signature.new(request_string, @key)
    end

    def request_string
      MWS::QueryString::RequestString.new(method: @method, endpoint: @endpoint, path: @path, params: expanded_params)
    end
  end
end
