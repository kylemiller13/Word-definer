require('sinatra')
require('sinatra/reloader')
require('./lib/word')
require('./lib/definitions')
require('pry')
also_reload('lib/**/*.rb')

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
  @word = Word.find(params[:id].to_i)
  @definitions = Definitions.find_by_wordid(@word.id)
  erb(:definition)
end

post('/definition/word/:id') do
  @wordid = params[:id].to_i
  @word = Word.find(@wordid)
  new_definition = params[:new_definition]
  newdefinition = Definitions.new(new_definition, @wordid, nil)
  newdefinition.save
  @definitions = Definitions.find_by_wordid(@word.id)
  erb(:definition)
end
