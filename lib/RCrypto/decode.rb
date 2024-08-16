# lib/RCrypto/decode.rb

module RCrypto
  module Decode
    def self.xor_decrypt(text, key)
      RCrypto::Encode.xor_encrypt(text, key)  # XOR encryption is its own inverse
    end

    def self.base64_custom_decode(text)
      Base64.strict_decode64(text)
    end

    def self.caesar_cipher_decrypt(text, shift)
      RCrypto::Encode.caesar_cipher_encrypt(text, 26 - shift)
    end

    def self.remove_fake_token(text)
      text.gsub(/\$[a-zA-Z0-9]{10}/, '')
    end
  end
end
