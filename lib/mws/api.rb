require "mws/query_string"
require "mws/request"

module MWS
  module API
    module_function

    def request(method, args, default_version)
      action = method.to_s.split("_").map(&:capitalize).join
      args[:params] = {"Action" => action, "Version" => default_version}.merge(args[:params])
      args = args.merge({path: "/?#{MWS::QueryString.new(args)}"})

      req = MWS::Request.new(args)
      res = req.execute
      res.body
    end
  end
end
