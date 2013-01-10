#!/Users/bcabalo/.rvm/rubies/ruby-1.9.3-p194/bin/ruby

require './trie'
require './compound_word_searcher'
require "test/unit"

class TestCompoundWordSearcher < Test::Unit::TestCase
  DICT_FILE_NAME = "test_words.txt" 

  def setup 
    # Load words from file into memory
    @words = []
    File.open(DICT_FILE_NAME).each do |word|
      word.chomp!
      @words << word
    end

    # Preprocess dictionary
    # Build dictionary word prefix trie with word array for 
    # O(l), where l is length of word, lookup time
    @trie = Trie.new(@words)

    # Use custom searcher
    @searcher = CompoundWordSearcher.new
  end

  def test_compound_words
    word = "ratdog"
    assert_equal(true, @searcher.compound_word?(word, @trie))
    word = "ratdogratdogdogdogratratdog"
    assert_equal(true, @searcher.compound_word?(word, @trie))
    word = "hippopotamusescatxdogcatsratra"
    assert_equal(false, @searcher.compound_word?(word, @trie))
    word = "ratcatdogcatrathippopotamusesdogcatsdogdogcatxdogcatsratcatsdogcatscatscat"
    assert_equal(true, @searcher.compound_word?(word, @trie))
    word = "strawberryyanyan"
    assert_equal(false, @searcher.compound_word?(word, @trie))
  end
end
