
def isPrime(x)
  return false if x <=0
  return true if x == 1 or x == 2
  (2..Math.sqrt(x).to_i).each do |i|
    return false if (x%(i)==0)
  end
  return true
end


if (ARGV.length == 0)
  puts "Usage: 'bored.rb N' where N is a positive integer"
else
  n = ARGV[0].to_i
  (1..n).each do |i| 
    print i, ' ' if isPrime(i)
  end
end

