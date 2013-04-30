#!/usr/bin/env ruby
require 'csv'
require './getprice.rb'
ltc = LTCexrate.new

puts "What file would you like to write to?"
myfile = gets.chomp
if File.exist?(myfile)
 csv = CSV.open(myfile, "ab")
<<<<<<< HEAD
else
=======
end else
>>>>>>> 11224356078f6dc5cce9d2ca10b872f8e7e87694
 csv = CSV.open(myfile, "ab")
 csv << ['Unix Time', 'From', 'To', 'Average Value', 'Last Value']
end
csv << [ltc.time.to_i, ltc.from, ltc.to, ltc.avalue, ltc.lvalue]

