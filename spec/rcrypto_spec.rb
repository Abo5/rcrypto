require 'rspec'
require_relative '../lib/RCrypto'

RSpec.describe RCrypto::CustomEncryptor do
  let(:text) { 'Hello World!' }
  
  describe '.encrypt and .decrypt' do
    it 'encrypts and decrypts text correctly' do
      encrypted_text = RCrypto::CustomEncryptor.encrypt(text)
      decrypted_text = RCrypto::CustomEncryptor.decrypt(encrypted_text)
      
      expect(decrypted_text).to eq(text)
    end

    it 'produces different outputs for the same text with different keys' do
      encrypted_text_1 = RCrypto::CustomEncryptor.encrypt(text)
      encrypted_text_2 = RCrypto::CustomEncryptor.encrypt(text)
      
      expect(encrypted_text_1).not_to eq(encrypted_text_2)
    end
  end

  describe '.generate_key' do
    it 'generates a unique key each time' do
      key1 = RCrypto::CustomEncryptor.generate_key
      key2 = RCrypto::CustomEncryptor.generate_key

      expect(key1).not_to eq(key2)
      expect(key1.length).to eq(32)
      expect(key2.length).to eq(32)
    end
  end
end

RSpec.describe RCrypto::SimpleEncryptor do
  let(:text) { 'Hello World!' }
  let(:key) { RCrypto::SimpleEncryptor.generate_simple_key(20) }

  describe '.xor_encrypt and .xor_decrypt' do
    it 'encrypts and decrypts text correctly' do
      encrypted_text = RCrypto::SimpleEncryptor.xor_encrypt(text, key)
      decrypted_text = RCrypto::SimpleEncryptor.xor_decrypt(encrypted_text, key)

      expect(decrypted_text).to eq(text)
    end
  end

  describe '.caesar_encrypt and .caesar_decrypt' do
    it 'encrypts and decrypts text correctly with Caesar cipher' do
      shift = 5
      encrypted_text = RCrypto::SimpleEncryptor.caesar_encrypt(text, shift)
      decrypted_text = RCrypto::SimpleEncryptor.caesar_decrypt(encrypted_text, shift)

      expect(decrypted_text).to eq(text)
    end
  end

  describe '.substitution_encrypt and .substitution_decrypt' do
    it 'encrypts and decrypts text correctly with substitution cipher' do
      key = RCrypto::SimpleEncryptor.generate_simple_key(26)
      encrypted_text = RCrypto::SimpleEncryptor.substitution_encrypt(text, key)
      decrypted_text = RCrypto::SimpleEncryptor.substitution_decrypt(encrypted_text, key)

      expect(decrypted_text).to eq(text.downcase)
    end
  end

  describe '.simple_hash' do
    it 'produces the same hash for the same input' do
      hash1 = RCrypto::SimpleEncryptor.simple_hash(text)
      hash2 = RCrypto::SimpleEncryptor.simple_hash(text)

      expect(hash1).to eq(hash2)
    end

    it 'produces different hashes for different inputs' do
      hash1 = RCrypto::SimpleEncryptor.simple_hash(text)
      hash2 = RCrypto::SimpleEncryptor.simple_hash('Different text')

      expect(hash1).not_to eq(hash2)
    end
  end

  describe '.frequency_analysis' do
    it 'calculates frequency of characters in text' do
      frequency = RCrypto::SimpleEncryptor.frequency_analysis(text)
      
      expect(frequency['l']).to eq(3)
      expect(frequency['o']).to eq(2)
    end
  end

  describe '.seems_encrypted?' do
    it 'detects if text seems encrypted' do
      long_text = 'This is a longer text that should be more complex to encrypt and easier to detect as encrypted.'
      encrypted_text = RCrypto::SimpleEncryptor.xor_encrypt(long_text, key)
      puts "Encrypted Text: #{encrypted_text}"  # طباعة النص المشفر للتحليل
      expect(RCrypto::SimpleEncryptor.seems_encrypted?(encrypted_text)).to be true
    end
  
    it 'detects if text is not encrypted' do
      expect(RCrypto::SimpleEncryptor.seems_encrypted?(text)).to be false
    end
  end
  
end
