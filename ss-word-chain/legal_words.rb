$word_lib = File.readlines('word_lib.txt')
$word_lib.each { |w| w.chomp! }

def legal_word?(test_word, current=nil)
  if  $word_lib.include?(test_word) && test_word != current
    true
  else
    false
  end
end

def legal_addition_words(current,index)
  output = []
  ('a'..'z').each do |let|
    test_word = current.clone
    add_letter(test_word, index, let)
    output << test_word if legal_word?(test_word)
  end
  output.compact
end

def add_letter(word, index, let)
  word.split("").insert(index,let).join
end

def delete_letter(word, index)
  word.split("").slice(index)
  word
end

### Tests
 # words = ['strike','hysteria','blast']

 #puts "", "Test #1: legal_word? function working for words"
 #output = []
 #words.each { |word| puts legal_word?(word) }
 #words.each { |word| output << legal_word?(word) }
 #puts "output = ", output.compact.inspect

 #puts "", "Test #2: legal_addition_words function working"
 #puts legal_addition_words('slice',4)

 #puts "", "Test #3: delete_letter function is working"
 #puts delete_letter("charles", 3)
