require 'pry'
require 'prime'

class Puzzle

#range of acceptable values for a and b

  def initialize
    @range = (2..99)
  end

  def get_set_of_potential_pairs

    #set of all numbers 2 to 99
    all_possible_nums = (@range).to_a


    #set of all possible pairs where a >= b
    all_possible_pairs = []
      all_possible_nums.each do |x|
        all_possible_nums.each do |y|
          all_possible_pairs << [x, y] if x >= y
        end
      end
    all_possible_pairs.uniq!
    all_possible_pairs
  end


  def remove_double_prime_pairs(set_of_pairs)
    no_double_primes = set_of_pairs.map { |pair| pair if !pair[0].prime? || !pair[1].prime? }
    no_double_primes.compact!
    no_double_primes
  end

  def get_sums_of_primes
    primes = @range.map {|num| num if num.prime? }
    primes.compact!
    sums_of_primes = []
    primes.each do |prime1|
      primes.each do |prime2|
        sums_of_primes << prime1 + prime2
      end
    end
    sums_of_primes
  end

  def remove_prime_sum_pairs(set_of_pairs)
    prime_sums = self.get_sums_of_primes
    pairs_without_prime_sums = []
    set_of_pairs.each {|pair| pairs_without_prime_sums << pair unless prime_sums.include?(pair[0] + pair[1])}
    pairs_without_prime_sums
  end

  def get_all_sums(set_of_pairs)
    sums = {}
    index = 0
    set_of_pairs.map { |pair| sums[index.to_s] = (pair[0] + pair[1]); index += 1}
    sums
  end

  def remove_pairs_with_unique_sums(set_of_pairs)

    sums_of_pairs = self.get_all_sums(set_of_pairs)
    groups_of_sums = sums_of_pairs.group_by { | key, value | value }
    unique_sums = groups_of_sums.select {|k,v| v.length == 1}
    indexes_of_unique_sum_pairs =  []
    unique_sums.each_value {|v| indexes_of_unique_sum_pairs << v[0][0].to_i}
    indexes_of_unique_sum_pairs.each do |index|
      set_of_pairs[index] = nil
    end
    pairs_without_unique_sums = set_of_pairs.compact!
    pairs_without_unique_sums
  end

  def get_all_products(set_of_pairs)
    products = {}
    index = 0
    set_of_pairs.map { |pair| products[index.to_s] = (pair[0] * pair[1]); index += 1}
    products
  end

  def find_pair_with_unique_product(set_of_pairs)
    products_of_pairs = self.get_all_products(set_of_pairs)
    groups_of_products = products_of_pairs.group_by { |key, value | value }
    unique_products = groups_of_products.select { |k,v| v.length == 1 }
    indexes_of_unique_products = []
    unique_products.each_value {|v| indexes_of_unique_products << v[0][0].to_i }
    solutions = indexes_of_unique_products.map { |index| set_of_pairs[index]}
    solutions

  end

  def find_pair_with_unique_sum(set_of_pairs)
    sums_of_pairs = self.get_all_sums(set_of_pairs)
    groups_of_sums = sums_of_pairs.group_by { |key, value | value }
    unique_sums = groups_of_sums.select { |k,v| v.length == 1 }
    indexes_of_unique_sums = []
    unique_sums.each_value {|v| indexes_of_unique_sums << v[0][0].to_i }
    solutions = indexes_of_unique_sums.map { |index| set_of_pairs[index]}
    solutions

  end

end 

#start script

sum_product = Puzzle.new

pairs_meeting_initial_constraints = sum_product.get_set_of_potential_pairs
puts "Pairs meeting initial constraints: #{pairs_meeting_initial_constraints.count}"


#First product constraint: Mr. P doesn't know the numbers, so at least one of the pair is NOT prime
pairs_meeting_first_product_constraint = sum_product.remove_double_prime_pairs(pairs_meeting_initial_constraints)
puts "Pairs where one or more values is NOT prime: #{pairs_meeting_first_product_constraint.count}"


#2nd constraint: Mr S knows P doesn't know, so SUM is NOT sum of 2 primes either
pairs_meeting_first_sum_constraint = sum_product.remove_prime_sum_pairs(pairs_meeting_first_product_constraint)
puts "Pairs where sum is NOT sum of 2 primes: #{pairs_meeting_first_sum_constraint.count}"


#3rd constraint: Mr. S still doesn't know, so multiple remaining pairs have desired sum
pairs_meeting_second_sum_constraint = sum_product.remove_pairs_with_unique_sums(pairs_meeting_first_sum_constraint)
puts "Remaining pairs without unique sums: #{pairs_meeting_second_sum_constraint.count}"

#4th constraint: Mr. P now knows, so one of remaining pairs has unique product
pairs_meeting_second_product_constraint = sum_product.find_pair_with_unique_product(pairs_meeting_second_sum_constraint)
puts "Remaining pairs with unique products: #{pairs_meeting_second_product_constraint.count}"

#5th constraint: Mr. S now knows, so of remaining pairs that make unique products, only one adds to possible sum

pairs_meeting_third_sum_constraint = sum_product.find_pair_with_unique_sum(pairs_meeting_second_product_constraint)

puts "result: #{pairs_meeting_third_sum_constraint}"
