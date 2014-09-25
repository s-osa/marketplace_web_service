# MarketplaceWebService

[![Gem Version](https://badge.fury.io/rb/marketplace_web_service.svg)](http://badge.fury.io/rb/marketplace_web_service)
[![Build Status](https://travis-ci.org/e-maido/marketplace_web_service.svg?branch=master)](https://travis-ci.org/e-maido/marketplace_web_service)
[![Coverage Status](https://img.shields.io/coveralls/e-maido/marketplace_web_service.svg)](https://coveralls.io/r/e-maido/marketplace_web_service)

MarketplaceWebService is a wrapper gem for Amazon Marketplace Web Service(MWS) API.

### Features

- Build request path form arguments
  - Set default values(API Version, Signature Version, Signature Method, Timestapm, etc...)
  - Expand arrays
  - Escape unsafe characters
  - Make signature and add it to query string
  - Combine request path and query string
- Provide default HTTP headers
  - Content-Type
  - Content-MD5
  - User-Agent

More detail is available in [Amazon MWS Developer Guide](https://images-na.ssl-images-amazon.com/images/G/01/mwsportal/doc/en_US/bde/MWSDeveloperGuide._V350841711_.pdf) 

This gem does NOT provides features below.

- Throttling
- Build body XML

## API Sections

- :white_check_mark:      Feeds (2009-01-01)
- :white_check_mark:      Reports (2009-01-01)
- :ballot_box_with_check: Orders
- :ballot_box_with_check: Products
- :ballot_box_with_check: Recommendations
- :ballot_box_with_check: Sellers
- :ballot_box_with_check: Subscriptions

## Installation

Add this line to your application's Gemfile:

    gem 'marketplace_web_service'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install marketplace_web_service

## Examples

### Feeds

```ruby
args = {
  key: "YOUR_SECRET_KEY",
  endpoint: "mws.amazonservices.jp",
  params: {
    "AWSAccessKeyId" => "YOUR_ACCESS_KEY_ID",
    "SellerId" => "YOUR_SELLER_ID",
    "FeedType" => "_POST_PRODUCT_PRICING_DATA_"
  },
  body: xml_string,
  headers:  { 'Contet-Type' => "text/xml; charset=iso8859-1" }
}

MWS::Feed.submit_feed(args) #=> Response XML String
```

### Reports

```ruby
args = {
  key: "YOUR_SECRET_KEY",
  endpoint: "mws.amazonservices.jp",
  params: {
    "AWSAccessKeyId" => "YOUR_ACCESS_KEY_ID",
    "SellerId" => "YOUR_SELLER_ID",
    "ReportTypeList" => ["_GET_FLAT_FILE_ORDERS_DATA_"],
    "Acknowledged" => false,
    "MaxCount" => 100
  }
}

MWS::Report.get_report_list(args) #=> Response XML String
```

## Contributing

1. Fork it ( https://github.com/[my-github-username]/marketplace_web_service/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
