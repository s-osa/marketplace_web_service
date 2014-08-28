require 'spec_helper'

describe MWS::QueryString::UriEncoder do
  describe "#encode" do
    let(:encoder){ MWS::QueryString::UriEncoder.new }

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

    mappings.each do |before, after|
      describe "\"#{before}\"" do
        subject{ encoder.encode(before) }
        it{ is_expected.to eq(after) }
      end
    end
  end
end
