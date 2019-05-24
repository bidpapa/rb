array = []
numbers = (10..100)
numbers.each { |i|
  if i%5 == 0
    array.push(i)
  end
}
puts array
