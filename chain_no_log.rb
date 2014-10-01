require_relative 'possible_words'

def optimal_length(starting_word, target)
  count ||= (starting_word.length - target.length).abs + 1
  short_word = starting_word.length < target.length ? starting_word : target
  long_word = starting_word.length > target.length ? starting_word : target
  (0..short_word.length-1).each do |index|
    count += 1 unless long_word.include?(short_word[index])
  end
  count
end

def word_chain(starting_word, target, target_length=nil)
  $solution ||= [starting_word]
  $sol_found ||= false
  $target_length ||= optimal_length(starting_word, target)
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
  $solution.pop unless $solution == false
end

