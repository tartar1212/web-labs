require_relative 'logic'

ARGF.each do |line|
  puts transform_word(line.chomp)
end
