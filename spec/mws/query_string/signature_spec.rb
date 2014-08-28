require 'spec_helper'

describe MWS::QueryString::Signature do
  let(:signature){ MWS::QueryString::Signature.new(text, key) }
  let(:text){ "This text will be signed." }
  let(:key){ "ThisIsSigningKey" }
  let(:signed_string){ "6/r286zqzGe2NW6oVT9he24kp0GEdvhT/uDP43VNFzQ=" }

  describe "initialize" do
    subject{ signature }
    it{ is_expected.to be_a String }
    it("should be signed string"){ is_expected.to eq(signed_string) }
  end
end
