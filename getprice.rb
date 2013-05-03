#!/usr/bin/env ruby
require 'rubygems'
require 'json'
require 'net/https'
require 'uri'

class Exrate

 def initialize
  @lvalue = -1 #last exchange rate in usd
  @avalue = -1 #average exchange rate
  @time = 0
  @from = 'generic' #currency exchanging from
  @to = 'generic' #currenct exchanging for
  getprice
 end

 def from
  @from
 end

 def to
  @to
 end

 def avalue
  @avalue
 end
 
 def lvalue
  @lvalue
 end

 def time
  @time
 end
 
 def getprice
  #get the current price
 end
 
end

class LTCexrate < Exrate
 def initialize
  super()
  @from = 'LTC'
  @to = 'USD'
 end
 def getprice
  uri = URI.parse('https://btc-e.com/api/2/ltc_usd/ticker')
  #uri = URI.parse('http://localhost/sample.json')
  http = Net::HTTP.new(uri.host, uri.port)
  if uri.class.to_s == "URI::HTTPS" 
   http.use_ssl = true
  end
  request = Net::HTTP::Get.new(uri.request_uri)
  response = http.request(request)
  if response.code == '200'
   data = JSON.parse(response.body)
   #result.each do |data| #acces values data["key"]
   @lvalue = data["ticker"]['last']
   @avalue = data["ticker"]['avg']
   @high = data['ticker']['high']
   @low = data['ticker']['low']
   @time = Time.new
   puts 'done!'
   return 1
  else
   puts response.code
   return -1
  end
 end
 def high
  @high
 end
 def low
  @low
 end
end

ltc = LTCexrate.new
puts "Average litecoin to usd rate:" 
puts ltc.avalue
puts "Last litecoin to usd rate:"
puts ltc.lvalue
