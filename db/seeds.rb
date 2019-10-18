# => Seeds

Prompt.destroy_all

50.times do
    arr_of_words = Prompt.fetch(50)
    Prompt.create(text: arr_of_words.join(' '), length: 50)
end

puts "lmao 69 420 ⌨️ ⌨️ ⌨️ ⌨️ ⌨️ ⌨️ 420 69 lmao"