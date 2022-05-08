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

  describe("#==") do
    it("is the same word if it has the same attributes as another word") do
      word = Word.new("apple", nil)
      word2 = Word.new("apple", nil)
      expect(word).to(eq(word2))
    end
  end

  describe(".find") do
    it("finds a word by id") do
      word = Word.new("apple", nil)
      word.save()
      word2 = Word.new("pear", nil)
      word2.save()
      expect(Word.find(word.id)).to(eq(word))
    end
  end

  describe("#update") do
    it("updates a word by id") do
      word = Word.new("apple", nil)
      word.save()
      word.update("pear")
      expect(word.word).to(eq("pear"))
    end
  end

  describe("#delete") do
    it("deletes an album by id") do
      word = Word.new("apple", nil)
      word.save()
      word2 = Word.new("pear", nil)
      word2.save()
      word.delete()
      expect(Word.all).to(eq([word2]))
    end
  end

  describe("#definitions") do
    it("returns a word's definitions") do
      word = Word.new("apple", nil)
      word.save()
      def1 = Definitions.new("pear", word.id, nil)
      def1.save()
      def2 = Definitions.new("orange", word.id, nil)
      def2.save()
      expect(word.definitions).to(eq([def1, def2]))
    end
  end
end