class Definitions
  attr_reader :id 
  attr_accessor  :word_id, :definition

  @@definitions = {}
  @@total_rows = 0

  def initialize(new_definition, word_id, id)
    @definition = new_definition
    @word_id = word_id
    @id = id || @@total_rows += 1
  end

  def ==(def_to_compare)
    (self.definition() == def_to_compare.definition()) && (self.word_id() == def_to_compare.word_id())
  end

  def self.all
    @@definitions.values
  end

  def save() 
    @@definitions[self.id] = Definitions.new(self.definition, self.word_id, self.id)
  end

  def self.clear
    @@definitions = {}
  end

  def self.find(id)
    @@definitions[id]
  end

  def update(new_definition)
    @definition = new_definition
  end
  
  def delete
    @@definitions.delete(self.id)
  end

  def self.find_by_word(word_id)
    definitions = []
    @@definitions.values.each do |definition|
      if definition.word_id == word_id
        definitions.push(definition)
      end
    end
    definitions
  end
 


  # def self.find_by_word(word_id)
  #   Word.find(word_id)
  # end
end