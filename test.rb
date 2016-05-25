require 'pry'

puts "#{ 10.times.inject(0){|t,| t + 0.1} }"

puts "#{ 10.times.inject(0){|t,| t + Rational('0.1')} }"