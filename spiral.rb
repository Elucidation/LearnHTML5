
###############
def isPrime(x)
  return false if x <=0
  return true if x == 1 or x == 2
  (2..Math.sqrt(x).to_i).each do |i|
    return false if (x%(i)==0)
  end
  return true
end

#############

def printMap(arr, padding=3)
  arr.map{ |row| row.map{|cell| cell.to_s.center(padding) }.join(" ")}.join("\n"*(Padding/2+1))
end


def spiralOut(arr, maxN)
  # Start pos in center
  sX = arr[0].length/2
  sY = arr.length/2
  turnStep = 1 #How many steps till you turn
  direction = 0 # 0 = North, 1 = E, 2 = S, 3 = W
  stepsSinceTurn = 0
  turnCounter = 0
  
  (1..maxN).each do |i|
    break if (sY < 0 || sY >= arr.length || sX < 0 || sX >= arr[0].length)
    arr[sY][sX] = i if isPrime(i)
    if direction==0
      sY -= 1
      #STDERR.print "N#{turnStep}|#{sX},#{sY}| "
    elsif direction == 1
      sX += 1
      #STDERR.print "E#{turnStep}|#{sX},#{sY}| "
    elsif direction == 2
      sY += 1
      #STDERR.print "S#{turnStep}|#{sX},#{sY}| "
    elsif direction == 3
      sX -= 1
      #STDERR.print "W#{turnStep}|#{sX},#{sY}| "
    end
    
    stepsSinceTurn+=1
    if stepsSinceTurn == turnStep
      turnCounter += 1
      stepsSinceTurn = 0
      direction = (direction + 1)%4
      if turnCounter%2 == 0
        turnStep+=1
      end
    end
  end
  arr
end



#####
N = 5
X = ""
if (ARGV.length == 0)
  puts "Usage: 'spiral.rb N X P' where N is a positive integer, and X is the default"
  puts "P is padding, the spacing between numbers, not required, defaults to 3"
  puts "N = 25, X = '-' is a good example"
  Padding = 3
else
  N = ARGV[0].to_i unless N <= 0
  X = ARGV[1] if ARGV[1]
  if ARGV[2]
    Padding = ARGV[2].to_i 
  else
    Padding = (N*N).to_s.length # space between numbers
  end
end
######

m = Array.new(N,0)
m.map! { |row| row = Array.new(N,X) }

m = spiralOut(m,N*N)
#STDERR.puts "--"
puts printMap(m,Padding)