def encrypt(text, n)
  return text if text.empty? || text.nil? || n <= 0

  text.downcase!
  n.times do |i|
    even, odd = [], []
    text.chars.each_with_index do |element, index|
      index.even? ? even.push(element) : odd.push(element)
    end
    @encrypted_text = (odd + even).join
    puts "#{i + 1} iteration encryption is: #{@encrypted_text}"
    text = @encrypted_text
  end
end

def decrypt(encrypted_text, n)
  return encrypted_text if encrypted_text.empty? || encrypted_text.nil? || n <= 0

  n.times do |i|
    array = encrypted_text.chars
    odd, even = array.each_slice((array.size/2.0).round).to_a
    decrypt = even.zip(odd)
    text = decrypt.join
    puts "#{i + 1} iteration decryption is: #{text}"
    encrypted_text = text
  end
end

puts "Enter text: "
text = gets.chomp
puts "Enter number of iterations: "
n = gets.to_i

encrypt(text, n)
decrypt(@encrypted_text, n)

# data example: "Abcdefghij", 2
