letters = ('a'..'z')
vowels = ['a', 'e', 'i', 'o', 'u']
list = {}
i = 1
letters.each do |val|
  if vowels.include? val
    list[val] = i
  end
  i += 1   
end
puts list
