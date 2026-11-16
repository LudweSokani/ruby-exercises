# frozen_string_literal: true

def caesar_cipher(sentance, shift_number)
  sentance.each_char do |char|
    if char.match?(/[a-zA-Z]/)
      base = char.ord < 91 ? 65 : 97
      shifted_char = ((char.ord - base + shift_number) % 26) + base
      print shifted_char.chr
    else
      print char
    end
  end
end

caesar_cipher('What a string!', 5)
