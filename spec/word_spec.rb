require('rspec')
require('word')

describe ('#Word') do 
  
  before(:each) do 
    Word.clear
  end

  describe('.all') do
    it("returns all of the created words") do
      expect(Word.all).to(eq([]))
    end
  end





end