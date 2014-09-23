require "spec_helper"

describe MWS::QueryString::PercentEncodedString do
  describe "initialize" do
    mappings = {
      "abcdefghijklmnopqrstuvwxyz" => "abcdefghijklmnopqrstuvwxyz",
      "ABCDEFGHIJKLMNOPQRSTUVWXYZ" => "ABCDEFGHIJKLMNOPQRSTUVWXYZ",
      "0123456789" => "0123456789",
      "-_.~" => "-_.~",
      " " => "%20",
      "%" => "%25",
      "+" => "%2B",
      "/" => "%2F",
      ":" => "%3A",
      "=" => "%3D",
      "2009-08-20T01:10:27.607Z" => "2009-08-20T01%3A10%3A27.607Z"
    }

    subject{ described_class.new("") }
    it{ is_expected.to be_an_instance_of(described_class) }
    it{ is_expected.to be_a(String) }

    mappings.each do |before, after|
      describe "\"#{before}\"" do
        subject{ described_class.new(before) }
        it{ is_expected.to eq(after) }
      end
    end
  end
end
