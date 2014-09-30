puts "*******************************", "Welcome to the word chain game!"
puts "Would you like to tail your logs? (y/n)"
logs = gets.chomp
puts logs
puts logs.class
puts logs.inspect

if logs == 'y'
  puts "tail logs"
  require_relative "chain_with_log"
else
  puts "don't tail"
  require_relative "chain_no_log"
end


puts "", "Enter a starting word:"
starting_word = gets.chomp
puts "Enter a target word:"
target = gets.chomp

puts "", "One moment while I calculate the word chain . . ."
chain = word_chain(starting_word, target)
puts "Your solution is: #{chain.join(" --> ")}"
puts "Number of steps: #{chain.length}"
