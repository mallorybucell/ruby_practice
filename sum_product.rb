require 'pry'
require 'prime'

#set of all numbers 2 to 99
all_possible_nums = (2..99).to_a


#set of all possible pairs...

all_possible_pairs = []
  all_possible_nums.each do |x|
    all_possible_nums.each do |y|
      all_possible_pairs << [x, y] if x >= y
    end
  end
puts "Count of all possible pairs: #{all_possible_pairs.count}"


#Mr. P doesn't know numbers. So at least one num in pair is NOT prime

all_pairs_not_double_prime = all_possible_pairs.map {|pair| pair if !pair[0].prime? || !pair[1].prime?}
all_pairs_not_double_prime.compact!
puts "Count of all pairs not double primes: #{all_pairs_not_double_prime.count}"


#Mr. S knew P didn't know, so sum is NOT sum of 2 primes either
  #get primes in range
  all_possible_primes = []
  all_possible_nums.each { |num| all_possible_primes.push(num) if num.prime?}

  # all possible sums of primes
  prime_sums = []
  all_possible_primes.permutation(2).each {|pair| prime_sums.push(pair[0] + pair[1])}
  puts "Count of prime sums: #{prime_sums.count}"
  group_by = prime_sums.group_by{|sum| sum }
  puts "Group by count: #{group_by.count}"
  puts "#{group_by}"
  prime_sums.uniq!
  puts "Count of unique prime sums: #{prime_sums.count}"


  #remove pairs with prime sums as possibilities #
  all_pairs_not_prime_sums = []
  all_pairs_not_double_prime.each {|pair| all_pairs_not_prime_sums.push(pair) unless prime_sums.include?(pair[0] + pair[1]) }
  puts "Count of all pairs with non-prime sums: #{all_pairs_not_prime_sums.count}"

#Mr. P knows so one pair in remaining has unique product (all others repeat)

product_remaining_pairs = all_pairs_not_prime_sums.map{ |pair| pair[0] * pair[1]}
product_remaining_pairs_count = product_remaining_pairs.group_by{|product| product }
possible_product_pairs = product_remaining_pairs_count.map {|key, value| key if value.length == 1}
puts "#{possible_product_pairs.compact.count}"

#print "Mr. P thinks pair is #{unique_product_pair}"
