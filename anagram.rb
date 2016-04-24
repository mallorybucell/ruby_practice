require 'pry'

table = Hash.new { |h,k|
  h[k] = []
}
IO.foreach("/usr/share/dict/words") do |line|
  word = line.chomp
  key  = word.downcase.chars.sort.join
  table[key] << word
end

word     = ARGV[0].downcase
anagrams = table[word.chars.sort.join]
anagrams.map!(&:downcase)
anagrams.delete(word)
if anagrams.any?
  puts "Anagrams for '#{word}': #{anagrams.join(", ")}"
else
  puts "Sorry, no anagrams for '#{word}'"
end