class Definitions
  attr_reader :id 
  attr_accessor  :wordid, :definition

  @@definitions = {}
  @@total_rows = 0

  def initalize(new_definition, word_id, id)
    @definition = new_definition
    @wordid = word_id
    @id = id || @@total_rows += 1
  end

  def ==(def_to_compare)
    (self.new_definition() == def_to_compare.new_definition()) && (self.word_id() == def_to_compare.word_id())
  end

  def self.all
    @@definitions.values
  end

  def save 
    @@definitions[self.id] = Definitions.new(self.definition, self.wordid)
  end

  def ==(another_definition)
    self.definition() == another_definition.definition()
  end

  def self.clear
    @@definitions = {}
    @@total_rows = 0
  end

  def self.find(id)
    @@definitions[id]
  end

  def update(definition)
    @definitions = definition
  end
  
  def delete
    @@definitions.delete(self.id)
  end

  def self.find_by_wordid(word_id)
    definitions = []
    @@definitions.values.each do |definition|
      if definition.word_id == word_id
        definitions.push(definition)
      end
    end
    definitions
  end
end