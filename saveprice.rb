#!/usr/bin/env ruby
require 'csv'
require './getprice.rb'
require "readline"
def gets2
 return Readline.readline("> ", true)
end
def opencsv(file)
 if File.exist?(file)
  csv = CSV.open(file, 'ab')
 else
  csv = CSV.open(file, 'ab')
  csv << ['Unix Time', 'From', 'To', 'Average Value', 'Last Value', 'High', 'Low']
 end
 return csv
end 
def closecsv(csv)
 csv.close
end
def write_ltc(csv, ltc)
 csv << [ltc.time.to_i, ltc.from, ltc.to, ltc.avalue, ltc.lvalue, ltc.high, ltc.low]
end

puts "What file would you like to write to?"
myfile = gets2.chomp
puts 'How often would you like to write (in seconds)?'
mydelay = gets2.chomp.to_f
mycsv = opencsv(myfile)
ltc = LTCexrate.new
write_ltc(mycsv,ltc)
mycsv.flush()
while sleep mydelay
 ltc.getprice
 puts 'Writing at ' + ltc.time.to_s + ' With the value:' + ltc.lvalue.to_s
 write_ltc(mycsv,ltc)
 mycsv.flush()
end
