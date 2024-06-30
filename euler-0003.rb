#!/usr/bin/env ruby
require "cmath"
n = 600851475143
# primefactor will not be bigger than this
primesUnder = CMath.sqrt(n).ceil
# sieb des erastosthenes
potPrimes = [0, 0, 1, 1]
for i in 1..primesUnder - 4
	potPrimes << 1
end
for i in 0..potPrimes.length - 1
	if i > CMath.sqrt(primesUnder); break end
	if potPrimes[i] == 0; next end
	p = potPrimes[i]
	#puts "found prime: " + String(i)
	if p == 1
		for j in i + 1..potPrimes.length - 1
			if j % i == 0
				potPrimes[j] = 0
			end
		end
	end
end
primes = []
for i in 0..potPrimes.length - 1
	if potPrimes[i] == 1
		primes << i
	end
end
# puts primes
# puts " "
# rückwärts durch primzahlen gehen und teilbarkeit prüfen
for i in -(primes.length - 1)..0
	k = -i
	if n % primes[k] == 0
		puts primes[k]
		break
	end
end
