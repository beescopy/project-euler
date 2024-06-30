#!/usr/bin/env ruby
nTh = 10001
potPrimes = [0, 0, 1, 1]
for i in 1..110000
	potPrimes << 1
end
counter = 0
for i in 0..potPrimes.length - 1
	#if i % 100 == 0; puts String(i) + ".. counting:" + String(counter) end
	if potPrimes[i] == 0; next end
	p = potPrimes[i]
	#puts "found prime: " + String(i)
	counter += 1;
	if counter == nTh; puts i; return end
	if p == 1
		for j in i + 1..potPrimes.length - 1
			if j % i == 0
				potPrimes[j] = 0
			end
		end
	end
end
