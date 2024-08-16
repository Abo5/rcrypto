

# RCrypto

**RCrypto** is a custom encryption library for Ruby that offers a variety of encryption methods, including XOR encryption, Caesar cipher, and substitution cipher. It is designed for developers looking to implement secure communication features in their Ruby applications.

## Marketing Message

Do you want your script to look like this, hidden from prying eyes?

```
ZYLYMBLhG0XONonzLIUpDCeLQ$sWYR5GfbHgdTZAICPJndFRdeOBdzGUpFBNLoIErBxZ0BtBrCPNd==#9defa851ec8ec36149a13815ec6233c1
```

Instead of this?

```ruby
puts "Ruby Is The Best yoo Note: RCrypto Is Easy"
```

Use **RCrypto** to protect your hard-earned code from being stolen. Secure the source code you spent sleepless nights writing.

## Features

- **XOR Encryption**: A simple yet effective encryption method.
- **Caesar Cipher**: A classic encryption technique with customizable shifts.
- **Substitution Cipher**: Encrypt text by substituting characters with a shuffled alphabet.
- **Custom Key Generation**: Automatically generate secure keys for encryption.
- **Encryption Detection**: Identify whether a given text appears to be encrypted.

## Installation

To use RCrypto, follow the steps below to clone the repository and integrate it into your Ruby project.

### 1. Clone the Repository

Clone the RCrypto repository to your local machine:

```bash
git clone https://github.com/Abo5/rcrypto.git
```
#### or
```bash
gem install rcrypto
```
#### or
```ruby
source 'https://rubygems.org'

gem 'rcrypto' 
```
```bash
bundle install rcrypto
```

### 2. Require the Library in Your Ruby Script

After cloning the repository, require the library in your Ruby script:

```ruby
require 'rcrypto'
```

## Basic Usage

### Encrypting and Decrypting a Script

Suppose you have a Ruby script (`test.rb`) that you want to encrypt and later decrypt.

```ruby
require 'rcrypto'

# Read the original script
original_script = File.read('test.rb')

# Encrypt the script
encrypted_script = RCrypto::CustomEncryptor.encrypt(original_script)
puts "Encrypted script:"
puts encrypted_script

# Decrypt the script
decrypted_script = RCrypto::CustomEncryptor.decrypt(encrypted_script)
puts "\nDecrypted script:"
puts decrypted_script

# Execute the decrypted script
eval(decrypted_script)
```

### Encrypting with an Auto-generated Key

```ruby
# Read the original script
original_script = File.read('main.rb')

# Encrypt the script using an auto-generated key
encrypted_script = RCrypto::CustomEncryptor.encrypt(original_script)
puts "Encrypted script:"
puts encrypted_script

# Decrypt the script
decrypted_script = RCrypto::CustomEncryptor.decrypt(encrypted_script)
puts "\nDecrypted script:"
puts decrypted_script
```

## Advanced Usage

### Using the SimpleEncryptor for Custom Encryption

The `SimpleEncryptor` class allows for more flexibility with custom keys and ciphers.

```ruby
require 'rcrypto'

text = "Hello World!"
key = RCrypto::SimpleEncryptor.generate_simple_key(20)

# XOR Encryption
encrypted_text = RCrypto::SimpleEncryptor.xor_encrypt(text, key)
puts "XOR Encrypted text:"
puts encrypted_text

decrypted_text = RCrypto::SimpleEncryptor.xor_decrypt(encrypted_text, key)
puts "Decrypted text:"
puts decrypted_text

# Caesar Cipher Encryption
shift = 5
caesar_encrypted = RCrypto::SimpleEncryptor.caesar_encrypt(text, shift)
puts "Caesar Encrypted text:"
puts caesar_encrypted

caesar_decrypted = RCrypto::SimpleEncryptor.caesar_decrypt(caesar_encrypted, shift)
puts "Decrypted text:"
puts caesar_decrypted
```

### Detecting Encrypted Text

RCrypto can help determine if a given text appears to be encrypted.

```ruby
long_text = "This is a longer text that should be more complex to encrypt and easier to detect as encrypted."
encrypted_text = RCrypto::SimpleEncryptor.xor_encrypt(long_text, key)

if RCrypto::SimpleEncryptor.seems_encrypted?(encrypted_text)
  puts "The text seems to be encrypted."
else
  puts "The text does not appear to be encrypted."
end
```

## Contributing

Contributions are welcome! If you'd like to contribute to RCrypto, please follow these steps:

1. **Fork the repository.**
2. **Create a new branch** (`git checkout -b feature/YourFeatureName`).
3. **Make your changes** and commit them (`git commit -m 'Add some feature'`).
4. **Push to the branch** (`git push origin feature/YourFeatureName`).
5. **Open a Pull Request** on GitHub.

Please ensure your code follows the existing coding conventions and passes all tests.

## Running Tests

RCrypto uses RSpec for testing. To run the tests, ensure you have the required dependencies installed and run:

```bash
bundle install
bundle exec rspec
```

This will run the test suite and ensure everything is working as expected.

## License

This project is licensed under the MIT License. See the [LICENSE](https://github.com/Abo5/rcrypto/LICENSE) file for more details.

## Issues and Feedback

If you encounter any issues or have suggestions for improvements, please feel free to [open an issue](https://github.com/Abo5/rcrypto/issues) on GitHub. Your feedback is highly appreciated!

## Authors

- **MAVEN** - *Initial work* - [GitHub Profile](https://github.com/Abo5)

## Acknowledgments

- Special thanks to the open-source community for their continuous support.
- Inspired by classic encryption techniques and the need for secure communication in Ruby applications.

# rcrypto
# rcrypto
# rcrypto
# rcrypto
