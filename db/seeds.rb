# => Seeds

500.times do
    arr_of_words = Prompt.generate(5)
    Prompt.create(text: arr_of_words.join(' '), length: 5)
end

500.times do
    arr_of_words = Prompt.generate(25)
    Prompt.create(text: arr_of_words.join(' '), length: 25)
end

500.times do
    arr_of_words = Prompt.generate(50)
    Prompt.create(text: arr_of_words.join(' '), length: 50)
end

500.times do
    arr_of_words = Prompt.generate(75)
    Prompt.create(text: arr_of_words.join(' '), length: 75)
end

500.times do
    arr_of_words = Prompt.generate(100)
    Prompt.create(text: arr_of_words.join(' '), length: 100)
end



puts "lmao ⌨️ ⌨️ ⌨️ ⌨️ ⌨️ ⌨️ lmao" 