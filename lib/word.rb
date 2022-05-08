class Word
  attr_reader :id, :word

  @@words = {}
  @@total_rows = 0

  def initialize(word, id)
    @word = word
    @id = id || @@total_rows += 1
  end

    # read words
  def self.all
    @@words.values
  end
  
  def save
    @@words[self.id] = Word.new(self.word, self.id)
  end

  def ==(another_word)
    self.word == another_word.word()
  end

  def self.find(id)
    @@words[id]
  end

  
  def update(word)
    @word = word
  end

  def delete 
    @@words.delete(self.id)
  end

  def self.clear
    @@words= {}
    @@total_rows = 0
  end
  def self.GetAll
    @@words.all
  end
  def definitions
    Definition.find_word(self.id)
  end
end