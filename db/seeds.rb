# => Seeds

50.times do
    arr_of_words = Prompt.fetch(5)
    Prompt.create(text: arr_of_words.join(' '), length: 5)
end

50.times do
    arr_of_words = Prompt.fetch(50)
    Prompt.create(text: arr_of_words.join(' '), length: 50)
end

50.times do
    arr_of_words = Prompt.fetch(100)
    Prompt.create(text: arr_of_words.join(' '), length: 100)
end



puts "lmao 69 420 ⌨️ ⌨️ ⌨️ ⌨️ ⌨️ ⌨️ 420 69 lmao" 