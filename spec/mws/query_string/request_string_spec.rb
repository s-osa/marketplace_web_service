require 'spec_helper'

describe MWS::QueryString::RequestString do
  let(:request_string){ MWS::QueryString::RequestString.new(valid_params) }
  let(:valid_params) {
    {
      method: "POST",
      host:   "mws.amazonservice.com",
      path:   "/",
      params: {
        "Timestamp" => "12:34:56",
        "Attr2" => "Value2",
        "Attr1" => "Value1",
        "Attr3" => "Value3"
      }
    }
  }

  let(:valid_request_string){
    request_string = <<-REQUEST_STRING
POST
mws.amazonservice.com
/
Attr1=Value1&Attr2=Value2&Attr3=Value3&Timestamp=12%3A34%3A56
    REQUEST_STRING
    request_string.chomp
  }

  describe "initialize" do
    subject{ request_string }
    it{ is_expected.to be_a String }
    it("should be valid request string"){ is_expected.to eq(valid_request_string) }
  end
end
