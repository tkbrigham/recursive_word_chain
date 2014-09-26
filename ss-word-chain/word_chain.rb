require_relative 'possible_words'

def optimal_length(starting_word, target)
  [starting_word.length, target.length].max
end

def recursive_path(starting_word, target)
  solution ||= [starting_word]
  count ||= 0
  count += 1
  puts count
  poss_words(starting_word, target).each do |word|
    puts word
    solution << word
    if word == target
      if solution.length <= optimal_length(starting_word, target) 
        puts "HI, solution for #{starting_word} to #{target} is: #{solution}"
        return solution
      else
        puts "TEST 3"
        solution.pop
      end
    else
      puts "TEST4"
      recursive_path(word, target)
    end
  end
end

recursive_path("slicey","slider")

