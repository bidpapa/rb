puts "Введите значение первой стороны треугольника"
first = gets.chomp
puts "Введите значение второй стороны треугольника"
second = gets.chomp
puts "Введите значение третьей стороны треугольника"
third = gets.chomp

sides = [first.to_f, second.to_f, third.to_f].sort.reverse

message = ""
if sides[0] > sides[1]
	if sides[0]**2 == sides[1]**2 + sides[2]**2
		message = "Треугольник прямоугольный"
		if sides[1] == sides[2]
			message += " и равнобедренный"
		end
	end
elsif sides[0] == sides[1] && sides[1] == sides[2]
	message = "Треугольник равносторонний"	
elsif sides[0] == sides[1]
	message = "Треугольник равнобедренный"		
end

puts message