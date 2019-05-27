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
 
total_sum = 0

basket.each {  |name, value|
  item_total = value[:price] * value[:amount]
  total_sum += item_total
  puts "Продукт: #{name}, количество: #{value[:amount]}, итого: #{item_total}"  
}

puts basket
puts total_sum
