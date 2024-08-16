# RCrypto/lib/RCrypto.rb
require 'openssl'
require 'base64'
require 'digest'
require 'securerandom'

require_relative 'RCrypto/encode'
require_relative 'RCrypto/decode'

module RCrypto
  class CustomEncryptor
    # Encrypts the given text using a series of encryption steps
    def self.encrypt(text)
      key = generate_key
      stage1 = Encode.xor_encrypt(text, key[0..15])
      stage2 = Encode.base64_custom_encode(stage1)
      stage3 = Encode.caesar_cipher_encrypt(stage2, key.bytes.sum % 26)
      stage4 = Encode.add_fake_token(stage3)
      final_encrypted = stage4 + "#" + key
      final_encrypted
    end

    # Decrypts the given encrypted text using the same steps in reverse
    def self.decrypt(encrypted_text_with_key)
      encrypted_text, key = encrypted_text_with_key.split("#", 2)
      stage4 = Decode.remove_fake_token(encrypted_text)
      stage3 = Decode.caesar_cipher_decrypt(stage4, key.bytes.sum % 26)
      stage2 = Decode.base64_custom_decode(stage3)
      original_text = Decode.xor_decrypt(stage2, key[0..15])
      original_text
    end

    # Generates a random key using MD5 hash
    def self.generate_key
      Digest::MD5.hexdigest(SecureRandom.bytes(16))
    end
  end

  class SimpleEncryptor
    def initialize(key)
      @key = key
      @key = generate_simple_key(20)
    end

    # Performs XOR encryption using the provided key
    def self.xor_encrypt(text, key)
      Encode.xor_encrypt(text, key)
    end

    # Decrypts text that was encrypted using XOR
    def self.xor_decrypt(encrypted_text, key)
      Decode.xor_decrypt(encrypted_text, key)
    end

    # Encrypts the text using the Caesar cipher with the specified shift
    def self.caesar_encrypt(text, shift)
      Encode.caesar_cipher_encrypt(text, shift)
    end

    # Decrypts text that was encrypted using the Caesar cipher
    def self.caesar_decrypt(encrypted_text, shift)
      Decode.caesar_cipher_decrypt(encrypted_text, shift)
    end

    # Generates a simple substitution cipher key by shuffling the alphabet
    def self.generate_simple_key(length = 26)
      alphabet = ('a'..'z').to_a.shuffle.join
      alphabet
    end

    # Encrypts the text using a substitution cipher with the provided key
    def self.substitution_encrypt(text, key)
      alphabet = ('a'..'z').to_a.join
      text.downcase.tr(alphabet, key)
    end

    # Decrypts text that was encrypted using a substitution cipher
    def self.substitution_decrypt(encrypted_text, key)
      alphabet = ('a'..'z').to_a.join
      encrypted_text.tr(key, alphabet)
    end

    # Generates a simple hash of the text
    def self.simple_hash(text)
      hash = 0
      text.each_byte do |byte|
        hash = ((hash << 5) - hash) + byte
        hash = hash & 0xFFFFFFFF
      end
      hash.to_s(16)
    end

    # Analyzes the frequency of characters in the text
    def self.frequency_analysis(text)
      text.downcase.chars.group_by(&:itself).transform_values(&:count).sort_by { |_, v| -v }.to_h
    end

    # Determines if the text appears to be encrypted based on several criteria
    def self.seems_encrypted?(text)
      return false if text.length < 20  # Short texts are unlikely to be encrypted

      # Calculate entropy
      frequency = frequency_analysis(text)
      entropy = frequency.values.sum { |count| -count * Math.log2(count.to_f / text.length) }
      normalized_entropy = entropy / Math.log2(text.length)

      # Calculate the ratio of non-alphabetic characters
      non_alpha_chars_ratio = text.count("^a-zA-Z").to_f / text.length

      # Analyze patterns - number of repeated sequences
      repeated_patterns = text.scan(/(.+)\1/).size

      # Consider the text encrypted if entropy is very high,
      # if there is a high ratio of non-alphabetic characters,
      # or if the number of repeated patterns is very low
      normalized_entropy > 0.8 || non_alpha_chars_ratio > 0.3 || repeated_patterns < 2
    end
  end
end
