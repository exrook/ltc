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
  getprice
  
 end

 def avalue
  @avalue
 end
 
 def lvalue
  @lvalue
 end
 
 def getprice
  #get the current price
 end
 
end

class LTCexrate < Exrate
 def getprice
  #uri = URI.parse('https://btc-e.com/api/2/ltc_usd/ticker')
  uri = URI.parse('http://localhost/sample.json')
  puts uri
  http = Net::HTTP.new(uri.host, uri.port)
  #http.use_ssl = true
  request = Net::HTTP::Get.new(uri.request_uri)
  response = http.request(request)
  if response.code == '200'
   data = JSON.parse(response.body)
   #result.each do |data| #acces values data["key"]
   @lvalue = data["ticker"]['last']
   @avalue = data["ticker"]['avg']
   @time = Time.new
   puts 'done!'
   return 1
  else
   puts response.code
   return -1
  end
 end
end

ltc = LTCexrate.new
puts "Average litecoin to usd rate:" 
puts ltc.avalue
puts "Last litecoin to usd rate:"
puts ltc.lvalue
