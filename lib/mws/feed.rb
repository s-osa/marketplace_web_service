require "mws/api"

module MWS
  module Feed
    DEFAULT_VERSION = "2009-01-01"

    module_function

    def method_missing(method, args={})
      MWS::API.request(method, args, DEFAULT_VERSION)
    end
  end
end
