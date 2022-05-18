require('sinatra')
require('sinatra/reloader')
require('./lib/word')
require('./lib/definitions')
require('pry')
also_reload('lib/**/*.rb')
Pry.config.input = STDIN
Pry.config.output = STDOUT


get('/') do
  @words = Word.all
  erb(:words)
end

get('/words') do
  @words = Word.all
  erb(:words)
end

get('/words/new') do
  erb(:new_word)
end

post('/words') do
  word = params[:new_word]
  newwords = Word.new(word, nil)
  newwords.save
  redirect to('/words')
end

post('/editword') do
  @word = Word.find(params[:id].to_i)
  @word.update(params[:new_word])
  @word.save
  redirect to('/words')
end


get('/words/:id') do
  @word = Word.find(params[:id].to_i)
  erb(:word_edit)
end


delete('/words/:id') do
  @word = Word.find(params[:id].to_i)
  @word.delete
  @words = Word.all
  erb(:words)
end

get('/definition/word/:id') do
  @wordid = params[:id].to_i
  @word = Word.find(@wordid)
  
  new_definition = params[:new_definition]
  if new_definition != nil
    newdefinition = Definitions.new(new_definition, @word.id, nil)
    newdefinition.save
  end
  @definitions = Definitions.find_by_word(@wordid)
  erb(:definition)
end

post('/definition/word/:id/update/:defid') do
  # binding.pry
  @wordid = params[:id].to_i
  @defid = params[:defid].to_i
  @word = Word.find(@wordid)
  @definition = Definitions.find_by_defid(@defid)
  new_definition = params[:update_definition]
  @definition.update(new_definition)
  @definition.save
  @definitions = Definitions.find_by_word(@word.id)
  @redirectPath = '/definition/word/'+ params[:id]
  redirect to(@redirectPath)
end

delete('/definition/word/:id/Delete/:defid') do
  @definition = Definitions.find(params[:defid].to_i())
  @definition.delete()
  @word = Word.find(params[:id].to_i())
  @redirectPath = '/definition/word/'+ params[:id]
  redirect to(@redirectPath)
end
