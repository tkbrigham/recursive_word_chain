require_relative 'legal_words'

$word_lib = File.readlines('word_lib.txt')

def words_of_length(num_letters)
  $word_lib.select { |x| x.chomp!.length == num_letters }
end

six_let_words = words_of_length(6)
puts six_let_words[0..2].inspect

def optimal_length(starting_word, target)
  [starting_word.length, target.length].max
end

def length_adjustment(starting_word, target)
  sl = starting_word.length
  tl = target.length
  (-1 if sl > tl) || (1 if sl < tl) || 0
end

def optimal_words(current, target)
  output = []
  (0..(target.length-1)).each do |index|
    test_word = current.sub(current[index], target[index])
    legal_word?(test_word)
  end
  output
end

# word = optimal_words("spine", "plans")
# puts "optimal words:", word

def adjust_length_down_words(current, target)
  output = []
  (0..(current.length-1)).each do |index|
    puts "index: ", index
    next if current[index] == target[index]
    puts "output before:", output
    puts 'current:', current
    test_word = delete_letter(current, index)
    output << delete_letter(current, index)  if legal_word?(test_word)
    puts "output after:", output, "----------------------", ""
  end
  output
end

puts "delete words:", adjust_length_down_words("spit", "sim")

def adjust_length_up_words(current, target)
  output = []
  (0..(target.length-1)).each do |index|
    next if current[index] == target[index]
    output << legal_addition_words(current, index)
  end
end







