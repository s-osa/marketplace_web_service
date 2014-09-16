require 'spec_helper'

describe MWS::Report do
  describe ".method_missing" do
    describe ".get_report_list" do
      let(:valid_args){
        {
          key: "ThisIsSigningKey",
          endpoint: "mws.amazonservices.com",
          params: {
            "AWSAccessKeyId" => "AccessKeyIdString",
            "SellerId" => "SellerIdString",
            "ReportTypeList" => ["_GET_FLAT_FILE_ORDERS_DATA_"],
            "Acknowledged" => false,
            "MaxCount" => 100
          }
        }
      }

      before do
        response = double("request")
        expect(response).to receive(:body).and_return("BodyString")
        request = double("request")
        expect(request).to receive(:execute).and_return(response)
        expect(MWS::Request).to receive(:new).and_return(request)
      end

      subject { described_class.get_report_list(valid_args) }
      it { is_expected.to be_a String }
    end
  end
end
