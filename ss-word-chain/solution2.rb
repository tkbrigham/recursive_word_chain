require_relative 'possible_words'

$solution = []

def optimal_length(starting_word, target)
  length_diff = (starting_word.length - target.length).abs
  puts "opt length = #{length_diff}"
end

optimal_length("charles", "me")

def recursive_path(starting_word, target)
  $solution ||= [starting_word]
  count ||= 0
  count += 1
  puts count
  poss_words(starting_word, target).each do |word|
    puts "word = #{word}"
    $solution << word
    puts "solution = #{$solution.inspect}"
    puts "solution length = #{$solution.length}"
    puts "target = #{target}"
    if word == target
      puts "", "word equals target"
      throw(:done) 
    end

    if word == target
      if $solution.length <= optimal_length(starting_word, target) 
        puts "TEST 2"
        return $solution
      else
        puts "TEST 3"
        $solution.pop
        break
      end
    else
      puts "TEST4"
      recursive_path(word, target)
    end
  end

  catch(:done) do
    puts "this is the CATCH call"
    return $solution.inspect
  end

end

catch(:done) do
  puts $solution
end

#recursive_path("slicey","glider")

