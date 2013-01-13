class CompoundWordSearcher

  # Check for compounded words with word trie
  def compound_word?(word,trie,depth=0)
    depth = depth + 1
    node_ptr = trie.root
    null_node = Node.new("nil")

    # Recusive base case
    if word == "" and depth > 2 
      return true
    else
      # Check the trie and shift the trie pointer for each letter in word
      word.chars.each_with_index do |letter,index|
        char_node = Node.new(letter)

        # Shift trie pointer, check termination marker 
        if node_ptr.children.include?(char_node) and !node_ptr.children.include?(null_node)
          node_ptr = node_ptr.children.fetch(node_ptr.children.index(char_node))
        elsif node_ptr.children.include?(char_node) 
          node_ptr = node_ptr.children.fetch(node_ptr.children.index(char_node))
        else
          return false
        end
        
        # Remove substring and check resulting string on termination markers
        if node_ptr.children.include?(null_node)
          shortened_word = word[index+1..word.length-1]

          if compound_word?(shortened_word, trie, depth)
            return true
          else
            next
          end
        end
      end

      # Check last character termination marker
      if node_ptr.children.include?(Node.new("nil")) and depth > 2 
        return true
      else
        return false
      end
    end
  end

  # Search for compounded words
  # inputs: word list, trie
  # outputs: top two lengthiest compound words, compound word count,
  #   and runtime benchmarks
  def search(words,trie)
    compound_words = []
    largest_word = ""
    second_largest_word = ""
    word_length = 0

    words.each do |word|
      if compound_word?(word,trie)
        compound_words << word
      end
    end

    # Output number of compound words in dictionary
    puts
    puts "The number of compound words in list: " + compound_words.count.to_s
    puts

    # Output first and second largest word found
    compound_words.each do |compound_word|
      if compound_word.length > second_largest_word.length
        if compound_word.length > largest_word.length
          second_largest_word = largest_word
          largest_word = compound_word
        else
          second_largest_word = compound_word
        end 
      end 
    end  

    puts "Largest compound words (letter length):"
    puts " 1. #{largest_word} (#{largest_word.length})" 
    puts " 2. #{second_largest_word} (#{second_largest_word.length})" 
    puts
  end


  # Search for top 2 compounded words only
  # inputs: word list, trie
  # outputs: top two lengthiest compound words and runtime benchmarks
  def search_top_2(words,trie)
    compound_words = []
    largest_word = ""
    second_largest_word = ""
    word_length = 0

    words.each do |word|
      if word.length >= word_length
        if compound_word?(word,trie)
          compound_words << word

          if word.length > second_largest_word.length
            if word.length > largest_word.length
              second_largest_word = largest_word          
              largest_word = word
              word_length = second_largest_word.length
            else 
              second_largest_word = word 
              word_length = second_largest_word.length
            end 
          end
        end
      end
    end

    # Output first and second largest word found
    puts "Largest compound words (letter length):"
    puts " 1. #{largest_word} (#{largest_word.length})" 
    puts " 2. #{second_largest_word} (#{second_largest_word.length})" 
    puts
  end
end
