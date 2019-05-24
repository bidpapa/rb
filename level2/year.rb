puts "Enter day"
day = gets.to_i
puts "Enter monts"
month = gets.to_i
puts "Enter year"
year = gets.to_i

leap_year = (year % 4 == 0 && year % 100 != 0)  || year % 400 == 0

thirty_one_months = [1, 3, 5, 7, 8, 10, 12]

month_range = (1...month)
day_number = 0

month_range.each do  |i|
  if thirty_one_months.include? i
    day_number += 31
  elsif i == 2
    day_number += 28
  else
    day_number += 30
  end
end

day_number += day

if leap_year && month > 2
  day_number += 1
end

puts day_number
puts leap_year
