require_relative "chain_no_log"

def run_it
  puts "", "*******************************", "Welcome to the Word Chain Game!"
  puts "Would you like to tail your logs? (y/n)"
  logs = gets.chomp

  if logs == 'y'
    require_relative "chain_with_log"
  elsif logs == 'n'
    require_relative "chain_no_log"
  else
    puts "Wrong input! Try again."
    run_it
    return
  end

  starting_word = get_starting
  target = get_target

  puts "", "One moment while I calculate the word chain . . .", ""
  chain = word_chain(starting_word, target)
  puts "____________________________________________", ""
  unless chain.nil?
    puts "Your solution is: #{chain.join(" --> ")}"
    puts "Number of steps: #{chain.length}", ""
  end
end

def get_starting
  puts "______", "Enter a valid STARTING word:"
  starting_word = gets.chomp
  if $word_lib.include?(starting_word)
    starting_word
  else
    get_starting
  end
end

def get_target
  puts "______", "Enter a valid TARGET word:"
  target = gets.chomp
  if $word_lib.include?(target)
    target
  else
    get_target
  end
end

run_it
