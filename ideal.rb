print "Print your name "
name = gets.chomp
print "Enter your height "
height = gets.to_i
ideal_weight = height - 110
if ideal_weight < 0
	message = "#{name}, Your weight is already optimal"
else 
	message = "#{name}, Your ideal_weight is #{ideal_weight}"
end
puts message
