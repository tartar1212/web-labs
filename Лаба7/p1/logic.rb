def generate_file_with_numbers(name, lines = 15, max_number = 15)
  random_numbers = (0..lines).collect { |_| rand max_number }
  File.open(name, 'w') { |f| f.puts(random_numbers) }
end

def unique_numbers_from_file_into_file(from, into)
  array_of_numbers = File.open(from, 'r') { |f| f.map(&:to_i) }
  array_of_numbers.uniq!
  File.open(into, 'w') { |f| f.puts array_of_numbers }
end
