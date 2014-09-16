module MWS
  module Report
    DEFAULT_VERSION = "2009-01-01"

    def method_missing(method, args={})
      action = method.to_s.split("_").map(&:capitalize).join
      args[:params] = {"Action" => action, "Version" => DEFAULT_VERSION}.merge(args[:params])
      args = args.merge({path: "/?#{MWS::QueryString.new(args)}"})

      req = MWS::Request.new(args)
      res = req.execute
      res.body
    end

    module_function :method_missing
  end
end
