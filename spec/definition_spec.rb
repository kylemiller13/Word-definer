require('rspec')
require('definitions')
require('word')

describe ('#Definition') do 
  before(:each) do
  Definitions.clear()
  end

  describe('.all') do
    it("returns an empty array when there are no definitions") do 
      expect(Definitions.all).to(eq([]))
    end
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
      definition1 = Definitions.new("a red fruit", nil)
      definition2 = Definitions.new("a red fruit", nil)
    expect(definition1).to(eq(definition))
    end
  end

  describe(".all") do
    it("returns an array of definitions") do
      def1 = Definitions.new("a red fruit", @wordid, nil)
      def1.save()
      def2 = Definitions.new("a yellow fruit", @wordid, nil)
      def2.save()
      expect(Definitions.all).to(eq([def1, def2]))
    end
  end

  describe(".clear") do
    it("clears all definitions") do
      def1 = Definitions.new("a red fruit", @wordid, nil)
      def1.save()
      def2 = Definitions.new("a yellow fruit", @wordid, nil)
      def2.save()
      Definitions.clear()
      expect(Definitions.all).to(eq([]))
    end
  end

  describe("#save") do
    it("saves a definition") do
      def1 = Definitions.new("a red fruit", @wordid, nil)
      def1.save()
      expect(Definitions.all).to(eq([def1]))
    end
  end

  describe(".find") do
    it("finds a definition by id") do
      def1 = Definitions.new("a red fruit", @wordid, nil)
      def1.save()
      def2 = Definitions.new("a yellow fruit", @wordid, nil)
      def2.save()
      expect(Definitions.find(def1.id)).to(eq(def1))
    end
  end

  describe("#update") do
    it("updates a definition by id") do
      def1 = Definition.new("a red fruit", @wordid, nil)
      def1.save()
      def1.update("a yellow fruit", @wordid)
      expect(def1.str).to(eq("a yellow fruit"))
    end
  end

  describe("#delete") do
    it("deletes a definition by id") do
      def1 = Definition.new("a red fruit", @wordid, nil)
      def1.save()
      def2 = Definition.new("a yellow fruit", @wordid, nil)
      def2.save()
      def1.delete()
      expect(Definition.all).to(eq([def2]))
    end
  end
  describe(".find_by_word") do
    it("finds a definition for a word") do
      word2 = Word.new("apple", nil)
      word2.save()
      def1 = Definition.new("a red fruit", @wordid, nil)
      def1.save()
      def2 = Definition.new("a yellow fruit", word2id, nil)
      def2.save()
      expect(Definition.find_by_word(word2.id)).to(eq([def2]))
    end
  end

  describe("#word") do
    it("finds the word a definition belongs to") do
      def1 = Definition.new("a red fruit", @wordid, nil)
      def1.save()
      expect(def1.word()).to(eq(@word))
    end
  end
end