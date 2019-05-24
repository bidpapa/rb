basket = {}

loop do
  puts "Введите название"
  name = gets.chomp
  break if name == 'stop'  
  puts "Введите цену"
  price = gets.to_f
  puts "Введите количество"
  amount = gets.to_f
  
  basket[name] = {price => amount}

end
 
sum = {}

basket.each { |k,v|
  v.each { |key,value|
    sum[k] = key * value
  }
}

total_sum = 0

sum.each {  |k,v|
  total_sum += v
}

puts basket
puts sum
puts total_sum
