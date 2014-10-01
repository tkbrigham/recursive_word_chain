recursive_word_chain
==========

Creates a chain of words with the substitution, addition, or deletion or a single letter.

Clone the whole repo, or the require_relative calls will break!

Run the word_chain.rb file on Ruby ~> 2.0

Known issues:
- Program cannot currently determine if there exists no link between two valid
  words. This means that users can enter two valid words without a link, and the
program will script indefinitely.
- Specifically avoided OOP and scripted the whole thing, which leads to more difficult testing. 
