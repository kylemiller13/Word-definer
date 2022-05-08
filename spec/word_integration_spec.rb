require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe("create a word path", { :type => :feature }) do
  it("creates a word and then goes to the word page") do
    visit("/words")
    click_on("Add Word")
    fill_in("new_word", :with => "apple")
    click_on("Add")
    expect(page).to(have_content("apple"))
  end
end

describe("create a definition path", { :type => :feature }) do
  it("creates a word, definition and then displays definition") do
    word = Word.new("apple", nil)
    word.save()
    visit("/words/#{word.id}")
    fill_in("new_definition", :with => "a red fruit")
    click_on("Add")
    expect(page).to(have_content("homie"))
  end
end

describe("update a word", { :type => :feature }) do
  it("update a word and return to word page") do
    word = Word.new("apple", nil)
    word.save()
    visit("/words/#{word.id}")
    fill_in("new_word", :with => "pear")
    click_on("Update Word")
    expect(page).to(have_content("pear"))
  end
end

describe("edit a definition", { :type => :feature }) do
  it("edit a definition and return to word page") do
    word = Word.new("apple", nil)
    word.save()
    def1 = Definition.new("a red fruit", word.id, nil)
    def1.save()
    visit("/words/#{word.id}/definitions/#{def1.id}")
    fill_in(" ", :with => "a round fruit")
    click_on("Update")
    expect(page).to(have_content("a round fruit"))
  end
end

describe("delete a word", { :type => :feature }) do
  it("delete a word and return to word page") do
    word = Word.new("apple", nil)
    word.save()
    visit("/words/#{word.id}")
    click_on("Delete Word")
    expect(page).to(have_content(""))
  end
end

describe("delete a definition", { :type => :feature }) do
  it("delete a definition and return to word page") do
    word = Word.new("apple", nil)
    word.save()
    def1 = Definition.new("a red fruit", word.id, nil)
    def1.save()
    visit("/words/#{word.id}/definitions/#{def1.id}")
    click_on("Delete")
    expect(page).to(have_content(""))
  end
end