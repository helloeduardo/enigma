require './lib/enigma'
require './lib/enigma_cipher'
require './lib/enigma_bombe'

message = File.read(ARGV[0])

enigma = Enigma.new
plaintext = enigma.decrypt(message, ARGV[2], ARGV[3])

File.open(ARGV[1], 'w').write(plaintext[:decryption])

p "Created '#{ARGV[1]}' with the key #{plaintext[:key]} and date #{plaintext[:date]}"
