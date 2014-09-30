require_relative 'possible_words'

def optimal_length(starting_word, target)
  count ||= 0
  starting_word.split.each do |let|
  end
end

puts optimal_length("dog", "dogs")

def word_chain(starting_word, target, target_length=nil)
  $solution ||= [starting_word]
  $sol_found ||= false
  $target_length ||= optimal_length(starting_word, target)
  puts "***************************"
  puts "++++ WORD_CHAIN METHOD WITH TARGET LENGTH OF #{$target_length} ++++"
  recursive_path(starting_word, target, 0)
  if $sol_found && $solution.length <= $target_length
    puts "++++ WORD_CHAIN METHOD HAS FOUND SOL AT TARGET LENGTH #{$target_length} ++++"
    puts "", "----------------------", "Solution: #{$solution.join(" --> ")}"
    puts "", "Steps: #{$target_length}"
    return
  else
    puts "++++ WORD_CHAIN METHOD NOT AT TARGET LENGTH ++++"
    $target_length += 1
    $solution = [starting_word]
    word_chain(starting_word, target, $target_length)
  end
end



def recursive_path(current, target, count)
  count += 1
  puts "-----------------"
  puts "- TOP OF RECURSIVE PATH LEVEL #{count}"
  return $solution.inspect if $sol_found
  puts "- SOLUTION = #{$solution}, length = #{$solution.length}, target = #{$target_length}"
  poss_words_arr = poss_words(current, target).reject { |word| $solution.include?(word) }
  return $solution.inspect if $solution.length == $target_length
  if poss_words_arr.include?(target)
    puts "--- (level #{count}) TARGET IN POSSIBLE WORDS"
    $solution << target
    puts "--- (level #{count}) SOLUTION LENGTH = #{$solution.length}, target length = #{$target_length}"
    puts "--- (level #{count}) sol <= target? #{$solution.length <= $target_length}"
    if $solution.length <= $target_length
      puts "-----(level #{count}) SOLUTION IS TARGET LENGTH"
      $sol_found = true
      puts "**FINAL SOLUTION = #{$solution.inspect}"
      return $solution.inspect
    else
      puts "-----(level #{count}) SOLUTION IS NOT TARGET LENGTH"
      $solution.pop
      return $solution.inspect
    end
  else

    if ($solution.length + 1) == $target_length
      puts "SOLUTION LENGTH MAX WITHOUT SOL_FOUND, POP AND EXIT"
      return $solution.pop
    end

    puts "---(level #{count}) POSS WORDS = #{poss_words_arr}"
    puts "---(level #{count}) TARGET NOT IN POSSIBLE WORDS, ENTERING LOOP"

    poss_words_arr.each do |word|
      if $sol_found
        puts "-------(level #{count}) SOLUTION FOUND, EXITING LOOP"
        return $solution.inspect 
      end

      puts "-----(level #{count}) TRYING WORD #{word}"

      $solution << word
      puts "-----(level #{count}) SOLUTION IS #{$solution}"
      puts "-----(level #{count}) RE-ENTER RECURSIVE PATH"
      recursive_path(word, target, count)
    end
  end
  $solution.pop
end

#word_chain("codify", "sorry")
