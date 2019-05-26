basket = {}

loop do
  puts "Введите название"
  name = gets.chomp
  break if name == 'stop'  
  puts "Введите цену"
  price = gets.to_f
  puts "Введите количество"
  amount = gets.to_f
  
  basket[name] = { price: price, amount: amount }
end
 
sum = {}

basket.each do |name,value|
  sum[name] = value[:price] * value[:amount]
  puts "В корзине находится #{name}"  
end

total_sum = 0

sum.each {  |name,price|
  total_sum += price
}

puts basket
puts sum
puts total_sum
