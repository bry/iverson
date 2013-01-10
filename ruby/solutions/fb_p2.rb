#!/Users/bcabalo/.rvm/rubies/ruby-1.9.3-p194/bin/ruby

# Problem: Given Facebook labeled stickers, determine how many
# stickers are needed to create the following words from the 
# letters in those stickers 
# coffee => 2
# cafebook => 1

def calculateNumStickers(word)
  @@facebook_hash = { f:1,a:1,c:1,e:1,b:1,o:2,k:1 }
  length = word.length - 1 
  word_hash = {}
  stickers = 0

  for i in 0..length
    if word_hash[:"#{word[i].chr}"] == nil
      word_hash[:"#{word[i].chr}"] = 1 
    else
      word_hash[:"#{word[i].chr}"] = word_hash[:"#{word[i].chr}"] + 1 
    end
  end

  word_hash.keys.each do |key|
    temp_stickers = word_hash[:"#{key}"] / @@facebook_hash[:"#{key}"]
    temp_stickers = temp_stickers.ceil

    if temp_stickers > stickers
      stickers = temp_stickers
    end
  end

  stickers
end

#word = "coffee"
word = "ffffffffffffeeeeeeeeeeeeee"

stickers = calculateNumStickers(word)

puts "You need " + stickers.to_s + " " + (stickers > 1 ? "stickers" : "sticker" ) + " to create the word "+ word + "."
