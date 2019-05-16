print "Print your name "
name = gets.chomp
print "Enter your height "
height = gets.chomp
ideal_weight = height.to_i - 110
if ideal_weight < 0
	message = "#{name}, Your weight is already optimal"
else 
	message = "#{name}, Your ideal_weight is #{ideal_weight}"
end
puts message