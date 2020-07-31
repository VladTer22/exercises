def frequent_words(text)
  text.downcase!
  words = text.scan(/[[:alpha:]']+/)
  frequency = words.tally

  return words.clear if frequency.length < 3

  sorted = frequency.sort_by { |_key, value| -value }
  sorted.each_with_index do |element, index|
    puts "#{index + 1} most frequent word is: #{element}" if index < 3
  end
end

puts "Enter text:"
text = gets

frequent_words(text)

# text example: "hi, there, D'ark brave silly d'Ark, HI, hI) brAvE, d'ARK -hi"
