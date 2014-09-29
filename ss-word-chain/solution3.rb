require_relative 'possible_words'

def optimal_length(starting_word, target)
  length_diff = (starting_word.length - target.length).abs
  let_diff = 0
  (0..starting_word.length-1).each do |index|
    let_diff += 1 if starting_word[index] != target[index]
  end
  return length_diff + let_diff
end

$count ||= 0
$sol_found = false

def recursive_path(starting_word, target)
  return if $sol_found
  $solution ||= [starting_word]
  $count += 1
  puts "-- BEGINNING TOP OF RECURSIVE PATH, count = #{$count}, solution = #{$solution}"
  puts "poss words = #{poss_words(starting_word, target)}"
  puts "solution in possible words? #{poss_words(starting_word, target).include?(target)}"
  if poss_words(starting_word, target).include?(target)
    if $solution.length <= optimal_length(starting_word, target)
      $sol_found = true
      return
    else
      $solution.pop
    end
  end

  poss_words(starting_word, target).each do |word|
    puts "  ++ TESTING WORD = #{word}"
    $solution << word

    if word == target
      puts "    ** WORD EQUALS TARGET"
      if $solution.length <= optimal_length(starting_word, target) 
        puts "      ~~ SOLUTION EQUALS OPTIMAL LENGTH"
        $sol_found = true
        puts "Solution chain = #{$solution}"
        return
      else
        puts "      ~~ SOLUTION NOT EQUALS OPTIMAL LENGTH"
        $solution.pop
        break
      end
    else
      puts "    ** WORD NOT EQUALS TARGET"
      recursive_path(word, target)
    end
  end
  puts "_______________", ""
end

recursive_path("slides","slider")

