puts "Введите значение первой стороны треугольника"
first = gets.to_f
puts "Введите значение второй стороны треугольника"
second = gets.to_f
puts "Введите значение третьей стороны треугольника"
third = gets.to_f

if first === 0.0 || second === 0.0 || third === 0.0
	abort("Введены некорректные параметры")
end

cathetus1, cathetus2, hypotenuse = [first, second, third].sort!

right_triangle = cathetus1**2 + cathetus2**2 == hypotenuse**2
isosceles_right_triangle = right_triangle && cathetus1 == cathetus2
equilateral_right_triangle = cathetus1 == hypotenuse

if right_triangle === true
	puts "Прямоугольный треугольник"
end
if isosceles_right_triangle === true
	puts "Прямоугольный и равнобедренный треугольник"
end
if equilateral_right_triangle === true
	puts "Равносторонний и равнобедренный треугольник"
end
