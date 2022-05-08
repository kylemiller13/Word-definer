require('rspec')
require('pry')
require('word')
require('definitions')

describe ('#Word') do 
  
  before(:each) do 
    Word.clear()
    Definitions.clear()
  end

  describe('.all') do
    it("returns all of the created words") do
      expect(Word.all).to(eq([]))
    end
  end

  describe("#save") do
    it("saves a word") do
      word = Word.new("apple", nil)
      word.save()
      word2 = Word.new("pear", nil)
      word2.save()
      expect(Word.all).to(eq([word, word2]))
    end
  end

  describe('.clear') do
    it("clears all songs") do
      word1 = Word.new("hello", nil)
      word1.save
      words = Word.new("there", nil)
      words.save
      Word.clear
      expect(Word.all).to(eq([]))
    end
  end





end