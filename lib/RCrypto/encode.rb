# lib/RCrypto/encode.rb

module RCrypto
  module Encode
    def self.xor_encrypt(text, key)
      text.bytes.map.with_index do |byte, i|
        (byte ^ key.bytes[i % key.length]).chr
      end.join
    end

    def self.base64_custom_encode(text)
      Base64.strict_encode64(text)
    end

    def self.caesar_cipher_encrypt(text, shift)
      text.chars.map do |char|
        if char.match(/[a-zA-Z]/)
          base = char =~ /[a-z]/ ? 'a'.ord : 'A'.ord
          ((char.ord - base + shift) % 26 + base).chr
        else
          char
        end
      end.join
    end

    def self.add_fake_token(text)
      fake_token = "$" + SecureRandom.alphanumeric(10)
      insertion_point = SecureRandom.random_number(text.length)
      text.insert(insertion_point, fake_token)
    end
  end
end
