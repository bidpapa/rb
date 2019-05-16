puts "Введите значение a"
a = gets.chomp.to_f
puts "Введите значение b"
b = gets.chomp.to_f
puts "Введите значение c"
c = gets.chomp.to_f

if a.to_i == 0
	puts "Коэффициент при первом слагаемом не может быть равен 0"
else
	d = b**2 - 4*a*c
	if d < 0
		puts message = "Корней нет"
	elsif d == 0
		x1 = (-1*b) / (2*a)
		puts "Дискриминант = 0, один корень = #{x1}"
	else
		x1 = ((-1*b) + Math.sqrt(d)) / (2*a)
		x2 = ((-1*b) - Math.sqrt(d)) / (2*a)
		puts "Дискриминант = #{d}, корни #{x1} и #{x2}"
	end
end