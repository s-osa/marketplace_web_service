require 'spec_helper'

describe MWS::QueryString::Signatory do
  describe "#sign" do
    let(:signatory){ MWS::QueryString::Signatory.new(key) }
    let(:text){ "This text will be signed." }
    let(:key){ "ThisIsSigningKey" }
    let(:signed_string){ "6/r286zqzGe2NW6oVT9he24kp0GEdvhT/uDP43VNFzQ=" }

    subject{ signatory.sign(text) }
    it("should be signed string"){ is_expected.to eq(signed_string) }
  end
end
