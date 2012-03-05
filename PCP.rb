# Post Correspondance Problem
# Yuri Costa

$numOfComb = 0
$count = 0
$tail = 1
$found = 1 # Find one match and quit. Set this to a greater value if you want to continue looking for more matchs after finding the first one

# Tries the current combination
def tryContent(tryArray, dominosArray) 
  top = ""
  bottom = ""
  i=1
  while (tryArray[i] != nil)
    top += dominosArray[ (tryArray[i]) ][0]
    bottom += dominosArray[ (tryArray[i]) ][1]
    i += 1
  end
  if(top == bottom)
    puts "String Match:"
    puts "#{top} #{bottom}"
    print "Combination: "
      tryArray.each {|x| print x, "," if (x!=0) }
    $found -= 1
    return
  end
    
end

# Deal Combinatorical funcation I wrote to iterate 'dominos'
# This function is beautiful
def nextContent(tryArray, tail) # Dr. Ivey this is my late night recursion function (works wonders though), takes care of the combinations
  if(tryArray[tail] < $count-1) #try to just increment last position
    tryArray[tail] += 1
  elsif( (tail-1) >= 1)         # if that doesn't work, try previous position
      tryArray[tail] = 1
      nextContent(tryArray, (tail-1) )
  elsif( (tail == 1 ) && $tail < $numOfComb ) # if that fails, need to add another element to the tryArray
    tryArray[tail] = 1
    $tail += 1
    tryArray[$tail] = 1    
  else
    puts "No answer found with combination of up to #{$numOfComb} consecutive tiles of your total of #{$count-1} dominos/tiles"
    exit(0)
  end
  
  
  return tryArray
end

########## Main ################
puts "What is the file name (ex. dominos.txt) ?"

#DEBUG
fileName = gets.chomp 
#fileName = "dominos.txt" # no need to type filename over and over during debug 
#END DUBUG

puts "Filename: #{fileName}"
dominosFile = File.new(fileName, "r+")
dominosArray = Array.new {Array.new} # stores all dominos here
tryArray = Array.new  # store current combination to try
tryArray[0] = 0
tryArray[1] = 1

while (line = dominosFile.gets)
  
  if(line.chomp == "#END")
    break
  end
  dominosArray[$count] = line.split(' ') 
  #puts "#{line.chomp}-#{count}"
  $count += 1

end
dominosFile.close

$numOfComb = (dominosArray[0][0]).to_i

while($found > 0)
  
  if( tryContent(tryArray, dominosArray))
    puts "Result Found !!!"
    i=1
    while (tryArray[i] != nil)
      #puts " #{dominosArray[ (tryArray[i]) ]}"
      i += 1
    end
    break
  end #end If
  tryArray = nextContent(tryArray, $tail)
  
end