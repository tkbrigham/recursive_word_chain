require_relative 'change_word_length'

#$word_lib = File.readlines('word_lib.txt')

def words_of_length(num_letters)
  $word_lib.select { |x| x.chomp!.length == num_letters }
end

def optimal_length(starting_word, target)
  [starting_word.length, target.length].max
end

def length_adjustment(starting_word, target)
  sl = starting_word.length
  tl = target.length
  (-1 if sl > tl) || (1 if sl < tl) || 0
end


def poss_words(current, target)
  output = optimal_words(current, target)
  output << optimal_words_back(current, target)
  case length_adjustment(current, target)
  when 1
    output << add_let_words(current)
    output << non_opt_words(current)
    output << del_let_words(current)
  when -1
    output << del_let_words(current)
    output << non_opt_words(current)
    output << add_let_words(current)
  when 0
    output << non_opt_words(current)
    output << add_let_words(current)
    output << del_let_words(current)
  end
  output.flatten!.uniq!.reject! { |word| word == current }
  output
end


##### TEST ######
#words = poss_words("slides", "sliders")
#puts "poss_words for 'slides' to 'slider' = #{words.inspect}"
#################







