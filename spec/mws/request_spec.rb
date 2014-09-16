require 'spec_helper'

describe MWS::Request do
  let(:request){ MWS::Request.new(valid_args) }
  let(:valid_args){
    {
      path: "/?Attr=Value",
      endpoint: "mws.amazonservices.com",
      headers: {},
      body: ""
    }
  }

  describe "initialize" do
    subject{ request }
    it{ is_expected.to be_a MWS::Request }
  end

  describe "#execute" do
    context "POST" do
      before do
        http = Net::HTTP.new("")
        expect(http).to receive(:use_ssl=).with(true)
        expect(http).to receive(:start).and_yield(http)
        expect(http).to receive(:post)
        expect(Net::HTTP).to receive(:new).and_return(http)
      end

      it "should POST request" do
        expect{ request.execute }.not_to raise_error
      end
    end
  end
end
