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

  #puts "solution type is #{$solution.class}"
  #return

  $sol_found ||= false
  $target_length ||= 2
  puts "++++ WORD_CHAIN METHOD WITH TARGET LENGTH OF #{$target_length} ++++"
  recursive_path(starting_word, target)
  if $solution.length == $target_length
    puts "++++ WORD_CHAIN METHOD HAS FOUND SOL AT TARGET LENGTH #{$target_length} ++++"
    puts $solution.inspect
    return
  else
    puts "++++ WORD_CHAIN METHOD NOT AT TARGET LENGTH ++++"
    word_chain(starting_word, target, $target_length + 1)
  end
end

def recursive_path(current, target)
  $count ||= 0
  $count += 1
  puts "- TOP OF RECURSIVE PATH ##{$count}"
  return if $sol_found
  if poss_words(current, target).include?(target)
    puts "--- TARGET IN POSSIBLE WORDS"
    $solution << target
    if $solution.length == $target_length
      puts "----- SOLUTION IS TARGET LENGTH"
      $sol_found = true
      return
    else
      puts "----- SOLUTION IS NOT TARGET LENGTH"
      $solution.pop
      return
    end
  else
    puts "--- TARGET NOT IN POSSIBLE WORDS, ENTERING LOOP"
    poss_words(current, target).each do |word|
      puts "----- TRYING WORD #{word}"
      if $sol_found || $solution.length == $target_length
        puts "------- sol_found = #{$sol_found}, or #{$solution.length == $target_length}"
        puts "Solution = #{$solution.inspect}"
        return
      end
      $solution << word
      puts "----- RE-ENTER RECURSIVE PATH"
      recursive_path(word, target)
    end
  end
  puts "** END OF FUNCTION, Solution = #{$solution.inspect} **"
end

word_chain("slides", "glider")
