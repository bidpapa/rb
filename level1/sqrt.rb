puts "Введите значение a"
a = gets.to_f
puts "Введите значение b"
b = gets.to_f
puts "Введите значение c"
c = gets.to_f

if a == 0
	abort("Коэффициент при первом слагаемом не может быть равен 0")
end

d = b**2 - 4 * a * c

if d < 0
		puts "Корней нет"
	elsif d == 0
		x1 = (-b) / (2.0 * a)
		puts "Дискриминант = 0, один корень = #{x1}"
	else		
		sqrt = Math.sqrt(d)
		x1 = (-b + sqrt) / (2.0 * a)
		x2 = (-b - sqrt) / (2.0 * a)
		puts "Дискриминант = #{d}, корни #{x1} и #{x2}"	
end
