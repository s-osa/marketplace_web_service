require 'spec_helper'

describe MWS::QueryString do
  let(:query_string){ MWS::QueryString.new(valid_args) }
  let(:valid_args){
    {
      key: "ThisIsSigningKey",
      endpoint: "mws.amazonservice.com",
      params: {
        "Action" => "SubmitFeed",
        "Timestamp" => Time.new(2009, 8, 20, 1, 10, 27, 607)
      }
    }
  }

  describe "initialize" do
    subject{ query_string }
    it{ is_expected.to be_a String }
    it("should be formated with query style"){ is_expected.to match /\A([^=&]+=[^=&]+)(&[^=&]+=[^=&]+)*\Z/ }
    it("should be URI encoded"){ is_expected.not_to match /\A[A-Za-z0-9\-\_\.\~]*\Z/ }
    it("should have timestamp in ISO8601 format"){ is_expected.to match /\d{4}-\d{2}-\d{2}T\d{2}%3A\d{2}%3A\d{2}/ }
  end
end
