require './lib/enigma'
require './lib/enigma_cipher'
require './lib/enigma_bombe'

message = File.read(ARGV[0]).chomp

enigma = Enigma.new
plaintext = enigma.crack(message, ARGV[2])

File.open(ARGV[1], 'w').write(plaintext[:decryption])

p "Created '#{ARGV[1]}' with the key #{plaintext[:key]} and date #{plaintext[:date]}"
