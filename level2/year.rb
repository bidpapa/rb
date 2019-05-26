puts "Enter day"
day = gets.to_i
puts "Enter month"
month = gets.to_i
puts "Enter year"
year = gets.to_i

leap_year = (year % 4 == 0 && year % 100 != 0)  || year % 400 == 0

month_days = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]

month_days[1] = 29 if leap_year

days_number = month_days.take(month - 1).sum + day

puts days_number
