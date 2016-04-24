# int fib(int n) {
#     if(n == 0) return 1;
#     if(n == 1) return 1;
        
#     return fib(n - 2) + fib(n - 1);
# }



def find_fib_nth(n)
  if n == 0
    1
  elsif n == 1
    1
  else
   return (find_fib_nth(n - 2) + find_fib_nth(n - 1))
  end
end

#if n = 5
  #first call: (fib 3 --> fib(1) + fib(2) --> 1 + fib(0) + fib(1) --> 1 + 1 + 1 ==> 3)  
  # + 
  #(fib(4) --> fib(2) + fib(3) --> (fib(0) + fib(1)) + fib(1) + fib(2) --> 3 + fib(0) + fib(1)
  # 3 + 1 + 1 = 5
  # 5 + 3 = 8

puts "Enter a number: "
num = gets.chomp.to_i
puts "Finding #{num}th number of the Fibonacci sequence, starting from 0: 1, 1: 1..."


puts "\n \n \n"
puts find_fib_nth(num)