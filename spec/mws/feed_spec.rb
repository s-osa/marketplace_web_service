require 'spec_helper'

describe MWS::Feed do
  describe ".method_missing" do
    describe ".submit_feed" do
      let(:valid_args){
        {
          key: "ThisIsSigningKey",
          endpoint: "mws.amazonservices.com",
          params: {
            "AWSAccessKeyId" => "AccessKeyIdString",
            "SellerId" => "SellerIdString",
            "FeedType" => "_POST_PRODUCT_PRICING_DATA_"
          },
          body: request_body
        }
      }
      let(:request_body){ "" }

      before do
        response = double("request")
        expect(response).to receive(:body).and_return("BodyString")
        request = double("request")
        expect(request).to receive(:execute).and_return(response)
        expect(MWS::Request).to receive(:new).and_return(request)
      end

      subject { described_class.submit_feed(valid_args) }
      it { is_expected.to be_a String }
    end
  end
end
