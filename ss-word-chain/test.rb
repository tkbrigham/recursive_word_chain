$word_lib = File.readlines('word_lib.txt')

#def longest_word(file)
#  longest_elem = file.group_by(&:size).max.last
#  longest_elem.last.length
#end

# longest_word(file)

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

def legal_word?(word)
  $word_lib.include? word
end

def optimal_words(current, target)
  output = []
  (0..(target.length-1)).each do |index|
    test_word = current.sub(current[index], target[index])
    pick_legal_word(output, current, test_word)
  end
  output
end

def pick_legal_word(output, current, test_word)
  if legal_word?(test_word) && test_word != current
    output << test_word
  end
  output
end

word = pick_legal_word([], 'stingy', 'sting')
puts "legal word output:", word

word = optimal_words("spine", "plans")
puts "optimal words:", word

def adjust_length_down_words(current, target)
  output = []
  (0..(current.length-1)).each do |index|
    next if current[index] == target[index]
    test_word = current.sub(current[index], "")
    pick_legal_word(output, current, test_word)
  end
  output
end

puts "delete words:", adjust_length_down_words("spit", "sim")

def adjust_length_up_words(current, target)
  output = []
  (0..(target.length-1)).each do |index|
    next if current[index] == target[index]
#   ('a'..'z').each do |let|
#     test_word = current.sub(current[index], current[index].to_s + "#{let})
  end
end

def legal_addition_words(current,index)
  output = []
  ('a'..'z').each do |let|
    test_word = current.insert(index, let)
    puts "test word:", test_word
    puts "pick legal word:", pick_legal_word(output,current,test_word)
    output = pick_legal_word(output,current,test_word)
    current.slice!(index)
  end
  output
end

words = legal_addition_words("smile",5)
puts "legal addition words:", words
