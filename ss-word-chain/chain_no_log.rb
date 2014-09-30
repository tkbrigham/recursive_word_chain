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
  recursive_path(starting_word, target, 0)
  if $sol_found && $solution.length <= $target_length
    return $solution
  else
    $target_length += 1
    $solution = [starting_word]
    word_chain(starting_word, target, $target_length)
  end
end

def recursive_path(current, target, count)
  $solution ||= [current]
  count += 1
  return $solution.inspect if $sol_found
  poss_words_arr = poss_words(current, target).reject { |word| $solution.include?(word) }
  return $solution.inspect if $solution.length == $target_length

  if poss_words_arr.include?(target)
    $solution << target
    if $solution.length <= $target_length
      $sol_found = true
      return $solution.inspect
    else
      $solution.pop
      return $solution.inspect
    end
  else
    if ($solution.length + 1) == $target_length
      return $solution.pop
    end

    poss_words_arr.each do |word|
      if $sol_found
        return $solution.inspect 
      end
      $solution << word
      recursive_path(word, target, count)
    end
  end
  $solution.pop
end

#chain = word_chain('dog', 'dogs')
#puts chain
