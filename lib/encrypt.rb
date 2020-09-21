require './lib/enigma'
require './lib/enigma_cipher'
require './lib/enigma_bombe'

message = File.read(ARGV[0])

enigma = Enigma.new
ciphertext = enigma.encrypt(message)

File.open(ARGV[1], "w").write(ciphertext[:encryption])

p "Created '#{ARGV[1]}' with the key #{ciphertext[:key]} and date #{ciphertext[:date]}"
