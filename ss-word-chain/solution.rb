require_relative 'possible_words'

def optimal_length(starting_word, target)
  (starting_word.length - target.length).abs
end

optimal_length("charles", "me")


$sol_found ||= false
$count ||= 1

def recursive_path(starting_word, target)
  $solution ||= [starting_word]
  $count += 1
  puts "______________________","BEGINNING RECURSIVE"
  puts "solution chain = #{$solution.inspect}"
  puts "count = #{$count}"
  puts "********************"
  poss_words(starting_word, target).each do |word|
    puts "BEGINNING POSS WORDS LOOP"
    puts "poss words loop $sol_found? . . . #{$sol_found}"
    next if $solution.include?(word)
    $solution += [word]
    break if $sol_found
    puts "+++++++++++++", "Currently testing #{word}"
    if word == target
      puts "#{word} is the solution!"
      $sol_found = true
      puts "solution chain= #{$solution.inspect}"
      puts "count = #{$count}"
      return
    elsif $count >= optimal_length(starting_word, target)
      puts "Count of #{$count} reached, moving to next"
      next
    else
      puts "ELSE STATEMENT SOL FOUND. . . #{$sol_found}"
      recursive_path(word, target)
    end
  end
  $solution.pop
  puts "solution after completion of poss_words iteration= #{$solution}"
end

recursive_path("dicey","glider")

