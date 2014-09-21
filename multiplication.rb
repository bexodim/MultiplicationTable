class Multiplier
   def initialize(n = 10)
       @n = n
       @primes = [2]
       @table = []
       #guess of the nth prime number
   end

# finds list of n primes
   def nprimes
       if @n < 1
           @primes = []
           $stdout.write "Must choose an n >= 1!"
       elsif @n > 1
           # starting from 3 until we have a list of n primes...check to see if number is prime
           $num = 3
           while @primes.length < @n do
               @primes.each do |p|
                   if ($num % p) == 0
                       # num is not prime
                       # break and move to next num
                       break
                   else
                       # next prime unless we have checked all of the primes
                       # if num not divisible by any primes, then it is a prime
                       if p == @primes.last
                           @primes << $num
                       end
                   end
                   
               end
               $num += 2 # only checking odd numbers
           end
       end
   end
    
# creates multiplication table with list of primes
   def multiply
       @table << [" "]+@primes
       @primes.each do |p|
           @table << [p] + @primes.collect { |n| n*p}
       end
   end
    
# to print in table format to the console
   def printtable
       output = ""
       @table.each do |r|
           # maps to a table, adding extra spaces to make each width the same
           output += r.map { |p| p.to_s+" "*(@table.last.last.to_s.length-p.to_s.length)}.join(" | ")+"\n"
       end
       $stdout.write output
       
   end
end

if __FILE__ == $0
    m = Multiplier.new # 20 is about the highest n where it still looks clean
    m.nprimes
    m.multiply
    m.printtable
end

