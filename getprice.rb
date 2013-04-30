#!/usr/bin/which
require 'rubygems'
require 'json'
require 'net/http'
require 'uri'

class exrate

 def initialize
  
  @lvalue = -1 #last exchange rate in usd
  @avalue = -1 #average exchange rate
  @time = 0
  getprice
  
 end
 
 def getprice
  #get the current price
 end
 
end

class ltcexrate
 def getprice
  uri = URI.parse('https://btc-e.com/api/2/ltc_usd/ticker')
  http = Net::HTTP.new(uri.host, uri.port)
  request = Net::HTTP::Get.new(uri.request_url)
  response = http.request(request)
  if response.code == '200'
   result = json.parse(response.body)
   result.each do |data| #acces values data["key"]
  else
   return -1
  end
  @lvalue = data['ticker']['last']
  @avalue = data['ticker']['avg']
  @time = time.new
  return 1
 end
end
