# Enigma

## Table of Contents
  * [Description](#description)
  * [Learning Goals](#learning-goals)
  * [How To Run](#how-to-run)
  * [Design](#design)
  * [Model](#model)
  * [Self Evaluation](#self-evaluation)

## Description

  This ruby project is a message encryption/decryption program with code-cracking functionality. This Enigma program, inspired by the famous [Enigma machine](https://en.wikipedia.org/wiki/Enigma_machine), implements an encryption algorithm based on a complex [Vigenère cipher](https://en.wikipedia.org/wiki/Vigenère_cipher). This project furthers knowledge, exploration, and implementation of Object Oriented Solutions.

## Learning Goals  

  * Practice breaking a program into logical components
  * Build classes with single responsibilities.
  * Write organized readable code.
  * TDD a well-designed Object Oriented solution
  * Practice algorithmic thinking
  * Work with file i/o

## How To Run

You may `fork` and/or `clone` this repository locally, or [![Run on Repl.it](https://repl.it/badge/github/helloeduardo/build_a_person)](https://repl.it/github/helloeduardo/build_a_person)

### Encryption

Prepare a message to be encrypted by editing the `message.txt` file. From the command line, run the runner file `encrypt.rb` with an originating file and a destination file:

```
$ ruby ./lib/encrypt.rb message.txt encrypted.txt
```

Upon successful encryption, a confirmation is shown with the destination file, the key, and the date used for encryption:

```
Created 'encrypted.txt' with the key 82648 and date 240818
```

### Decryption

From the command line, run the runner file `decrypt.rb` with a previously encrypted file, a destination file, the key, and the date used for encryption:

```
$ ruby ./lib/decrypt.rb encrypted.txt decrypted.txt 82648 240818
```

A confirmation is shown with the destination file, the key, and the date used for decryption:

```
Created 'decrypted.txt' with the key 82648 and date 240818
```

### Crack

The code-cracking functionality can recover the original message with a previously encrypted file, without a key, if we know the date it was created *and* that the original `message.txt` ends with with the characters `" end"`.

Run the runner file `crack.rb` with a previously encrypted file, a destination file, and the date used for encryption:

```
$ ruby ./lib/crack.rb encrypted.txt cracked.txt 240818
```

A confirmation is shown with the destination file, the key, and the date used for cracking:

```
Created 'cracked.txt' with the cracked key 82648 and date 240818
```

## Design
The design structure begins with a command line interface with three runner files `encrypt.rb`, `decrypt.rb`, and `encrypt.rb`.

The runner files instantiate one central `Enigma` object with an encryption/decryption `Cipher` and a code-cracking `Bombe`.

Both the `Cipher` and `Bombe` objects are specialized implementations of a more general `Rotational Cipher`, and thus inherit basic functionality from the `Rotational Cipher` superclass.

The modules `Defaultable` and `Formatable` encapsulates extraneous functionality that does not fit the classes' single responsibility. The module `Offsetable` abstracts a shared method in the `Cipher` and `Bombe` class that creates offsets based on the date provided.

## Model
![Enigma Diagram](https://user-images.githubusercontent.com/56360157/93827595-c9a1c380-fc26-11ea-848e-8548db13f409.jpeg)

## Self Evaluation
- **Functionality** 4️⃣ - The cracking method and command line interface were successfully implemented
- **Object Oriented Programming** 4️⃣ - Modules and superclass implemented make logical sense.
- **Ruby Conventions and Mechanics** 4️⃣ - Methods are appropriately named. Code syntax and spacing was improved with help of `Rubocop`.
- **Test Driven Development** 4️⃣ - Test coverage using `Simple_Cov` shows 100% coverage. Mocks and stubs were utilized successfully.
- **Version Control** 4️⃣/3️⃣ - Appropriate commits. Pull requests based on logical chunks of functionality. Some commits/PRs may have included other functionality.
