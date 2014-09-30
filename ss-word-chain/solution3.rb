require_relative 'possible_words'

def optimal_length(starting_word, target)
  length_diff = (starting_word.length - target.length).abs
  let_diff = 0
  (0..starting_word.length-1).each do |index|
    let_diff += 1 if starting_word[index] != target[index]
  end
  return length_diff + let_diff
end

def word_chain(starting_word, target, target_length=nil)
  $solution ||= [starting_word]
  $sol_found ||= false
  $target_length ||= 3
  puts "++++ WORD_CHAIN METHOD WITH TARGET LENGTH OF #{$target_length} ++++"
  recursive_path(starting_word, target, 0)
  if $sol_found && $solution.length <= $target_length
    puts "++++ WORD_CHAIN METHOD HAS FOUND SOL AT TARGET LENGTH #{$target_length} ++++"
    puts $solution.join(" --> ")
    return
  else
    puts "++++ WORD_CHAIN METHOD NOT AT TARGET LENGTH ++++"
    $target_length += 1
    $solution = [starting_word]
    word_chain(starting_word, target, $target_length)
  end
end



def recursive_path(current, target, count)
  $solution ||= [current]
  count += 1
  puts "- TOP OF RECURSIVE PATH ##{count}"
  return $solution.inspect if $sol_found
  puts "- SOLUTION = #{$solution}, length = #{$solution.length}, target = #{$target_length}"
  poss_words_arr = poss_words(current, target).reject { |word| $solution.include?(word) }
  return $solution.inspect if $solution.length == $target_length
  if poss_words_arr.include?(target)
    puts "--- (path #{count}) TARGET IN POSSIBLE WORDS"
    $solution << target
    puts "--- (path #{count}) SOLUTION LENGTH = #{$solution.length}, target length = #{$target_length}"
    puts "--- (path #{count}) sol <= target? #{$solution.length <= $target_length}"
    if $solution.length <= $target_length
      puts "-----(path #{count}) SOLUTION IS TARGET LENGTH"
      $sol_found = true
      puts "**FINAL SOLUTION = #{$solution.inspect}"
      return $solution.inspect
    else
      puts "-----(path #{count}) SOLUTION IS NOT TARGET LENGTH"
      $solution.pop
      return $solution.inspect
    end
  else
    puts "---(path #{count}) POSS WORDS = #{poss_words_arr}"
    puts "---(path #{count}) TARGET NOT IN POSSIBLE WORDS, ENTERING LOOP"
    poss_words_arr.each do |word|
      puts "-----(path #{count}) TRYING WORD #{word}"
      if $sol_found || $solution.length == $target_length
        puts "-------(path #{count}) sol_found = #{$sol_found}, or #{$solution.length == $target_length}"
        return $solution.inspect 
      end
      $solution << word
      puts "-----(path #{count}) RE-ENTER RECURSIVE PATH"
      recursive_path(word, target, count)
    end
  end
  puts "** END OF FUNCTION, Solution = #{$solution.inspect} **"
end

word_chain("ruby", "code", 0)
