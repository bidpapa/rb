letters = ('a'..'z')
vowels_hash = %w[a e i o u]
list = {}

letters.each.with_index(1) do |letter, index|
  list[letter] = index if vowels_hash.include?(letter)  
end

puts list
