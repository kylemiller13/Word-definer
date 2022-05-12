require('rspec')
require('definitions')
require('word')
require('pry')
Pry.config.input = STDIN
Pry.config.output = STDOUT


describe ('#Definition') do 
  before(:each) do
    Definitions.clear()
    Word.clear()
    @word = Word.new("apple", nil)
    @word.save()
  end

  describe('#save') do 
    it("saves definition") do
      definition = Definitions.new("a red fruit", @word.id, nil)
      definition.save
      expect(Definitions.all).to(eq([definition]))
    end
  end

  describe('#==') do 
    it('returns true if two definitions are the same') do
      definition1 = Definitions.new("a red fruit", @word.id, nil)
      definition2 = Definitions.new("a red fruit", @word.id, nil)
    expect(definition1).to(eq(definition2))
    end
  end

  describe(".all") do
    it("returns an array of definitions") do
      def1 = Definitions.new("a red fruit", @word.id, nil)
      def1.save()
      def2 = Definitions.new("a yellow fruit", @word.id, nil)
      def2.save()
      expect(Definitions.all).to(eq([def1, def2]))
    end
  end

  describe(".clear") do
    it("clears all definitions") do
      def1 = Definitions.new("a red fruit", @word.id, nil)
      def1.save()
      def2 = Definitions.new("a yellow fruit", @word.id, nil)
      def2.save()
      Definitions.clear()
      expect(Definitions.all).to(eq([]))
    end
  end

  describe(".find") do
    it("finds a definition by id") do
      def1 = Definitions.new("a red fruit", @word.id, nil)
      def1.save()
      def2 = Definitions.new("a yellow fruit", @word.id, nil)
      def2.save()
      expect(Definitions.find(def1.id)).to(eq(def1))
    end
  end

  describe("#update") do
    it("updates a definition by id") do
      def1 = Definitions.new("a red fruit", @word.id, nil)
      def1.save()
      def1.update("a yellow fruit")
      expect(def1.definition).to(eq("a yellow fruit"))
    end
  end

  describe("#delete") do
    it("deletes a definition by id") do
      def1 = Definitions.new("a red fruit", @word.id, nil)
      def1.save()
      def2 = Definitions.new("a yellow fruit", @word.id, nil)
      def2.save()
      def1.delete()
      expect(Definitions.all).to(eq([def2]))
    end
  end

  describe(".find_by_word") do
    it("finds a definition for a word") do
      word2 = Word.new("apple", nil)
      word2.save()
      def1 = Definitions.new("a red fruit", word2.id, nil)
      def1.save()
      def2 = Definitions.new("a yellow fruit", word2.id, nil)
      def2.save()
      expect(Definitions.find_by_word(word2.id)).to(eq([def1, def2]))
    end
  end

  describe(".find_by_word") do
    it("finds the word a definition belongs to") do
      def1 = Definitions.new("a red fruit", @word.id, nil)
      def1.save()
      expect(Definitions.find_by_word(@word.id)).to(eq([def1]))
    end
  end
end