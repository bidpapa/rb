fibonacci = [0, 1]
next_number = 1

loop do 
  fibonacci << next_number
  next_number = fibonacci[-1] + fibonacci[-2]
  break if next_number > 100
end

puts fibonacci
