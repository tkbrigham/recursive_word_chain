require_relative 'legal_words'

def short_word_len(current, target)
  [current.length, target.length].min - 1
end
#puts short_word_len("tiny", "timothonious")

def optimal_words(current, target)
  output = []
  (0..short_word_len(current, target)).each do |index|
    next if current[index] == target[index]
    test_word = current.clone
    test_word[index] = target[index]
    output << test_word if legal_word?(test_word)
  end
  output
end

### TEST ###
#words = optimal_words("slides", "slider")
#puts "optimal words for 'slides' and 'slider': ", words.inspect, ""
############

def optimal_words_back(current, target)
  output = []
  (1..short_word_len(current, target)+1).each do |index|
    next if current[-index] == target[-index]
    test_word = current.clone
    test_word[-index] = target[-index]
    output << test_word if legal_word?(test_word)
  end
  output
end

### TEST ###
#words = optimal_words_back("dicey", "glided")
#puts "optimal words for 'slice' and 'climbings': ", words.inspect, ""
############


def add_letter(word, index, let)
  word.split("").insert(index,let).join
end

def legal_addition_words(current,index)
  output = []
  ('a'..'z').each do |let|
    test_word = add_letter(current, index, let)
    output << test_word if legal_word?(test_word)
  end
  output.compact
end

def add_let_words(current)
  output = []
  (0..(current.length)).each do |index|
    output << legal_addition_words(current, index)
  end
  output.compact.reject(&:empty?).flatten
end

### TEST ###
#words = add_let_words("slice", "climbs")
#puts "add words for 'slice' to 'climbs':", words.inspect, ""
############


def del_let_words(current)
  output = []
  (0..(current.length-1)).each do |index|
    test_word = current.clone
    test_word[index] = ""
    output << test_word if legal_word?(test_word)
  end
  output
end

### TEST ###
#words = del_let_words("slicer")
#puts "del words going from 'slicer' to 'climb':", words.inspect, ""
############

def non_opt_words(current)
  output = []
  (0..(current.length-1)).each do |index|
    ('a'..'z').each do |let|
      test_word = current.clone
      test_word[index] = let
      output << test_word if legal_word?(test_word)
    end
  end
  output.uniq
end

### TEST ###
#words = non_opt_words("slicer")
#puts "non-optimal words for 'slicer':", words.inspect, ""
############

