#!/Users/bcabalo/.rvm/rubies/ruby-1.9.3-p194/bin/ruby

require './trie'
require './compound_word_searcher'
require "test/unit"

class TestCompoundWordSearcher < Test::Unit::TestCase
  DICT_FILE_NAME = "words_for_problem.txt" 

  def setup 
    # Load words from file into memory
    @words = []
    File.open(DICT_FILE_NAME).each do |word|
      word.chomp!
      @words << word
    end

    # Preprocess dictionary
    @trie = Trie.new(@words)

    # Use custom searcher
    @searcher = CompoundWordSearcher.new
  end

  def test_basic_non_compound_words
    word = "aa"
    assert_equal(false, @searcher.compound_word?(word, @trie))
    word = "aal"
    assert_equal(false, @searcher.compound_word?(word, @trie))
    word = "lab"
    assert_equal(false, @searcher.compound_word?(word, @trie))
    word = "ax"
    assert_equal(false, @searcher.compound_word?(word, @trie))
    word = "jab"
    assert_equal(false, @searcher.compound_word?(word, @trie))
    word = "xanthan"
    assert_equal(false, @searcher.compound_word?(word, @trie))
  end

  def test_basic_compound_words
    word = "aahaa"
    assert_equal(true, @searcher.compound_word?(word, @trie))
    word = "abacaabaab"
    assert_equal(true, @searcher.compound_word?(word, @trie))
    word = "hippopotamusescatxdogcatsratra"
    assert_equal(false, @searcher.compound_word?(word, @trie))
    word = "abalonezymologieszygomorphicabbreviations"
    assert_equal(true, @searcher.compound_word?(word, @trie))
    word = "strawberryyanyan"
    assert_equal(false, @searcher.compound_word?(word, @trie))
  end

  def test_generate_random_compound_words 
    max_iterations = 10000

    for i in 0..max_iterations
      # Construct a valid compound word from words init in setup 
      compound_word_size = Random.rand(2..10)
      for j in 0..compound_word_size
        random_dictionary_word = @words[Random.rand(0..@words.length-1)]
        word = "#{word}#{random_dictionary_word}"
      end 

      # These constructed compound words should all test to true
      assert_equal(true, @searcher.compound_word?(word, @trie), "Fail word: #{word}")

      word = ""
    end
  end
end
