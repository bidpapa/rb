fib = 0
array = []
loop do    
  if fib == 0
    fib += 1
    array.push(fib)
  end
  if fib == 1
    array.push(fib)
    fib += 1     
    array.push(fib)              
  else 
    fib += array[-2]
    break if fib > 100   
    array.push(fib)
  end    
end

puts array
