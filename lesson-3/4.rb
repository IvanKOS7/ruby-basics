alphabet = ('a'..'z').to_a
numbers = (1..26).to_a
a = alphabet.zip(numbers)
hash = a.to_h
print hash
