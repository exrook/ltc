#!/usr/bin/env ruby
require 'csv'
require './getprice.rb'
require "readline"
def getsbetter
 buf = Readline.readline("> ", true)
 return buf
end
ltc = LTCexrate.new

puts "What file would you like to write to?"
myfile = getsbetter.chomp
if File.exist?(myfile)
 csv = CSV.open(myfile, "ab")
else
 csv = CSV.open(myfile, "ab")
 csv << ['Unix Time', 'From', 'To', 'Average Value', 'Last Value']
end
csv << [ltc.time.to_i, ltc.from, ltc.to, ltc.avalue, ltc.lvalue]

