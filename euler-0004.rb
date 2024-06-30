#!/usr/bin/env ruby
def testPalindrome(word)
	for i in 0..word.length/2.0.floor - 1
		if word[i] != word[word.length - 1 -i]
			return 0
		end
	end
end
b = 0
for i in 1..999
	for j in 1..999
		if testPalindrome(String(i*j)) != 0
			#puts String(i*j)
			if b < i*j
				b = i*j
			end
		end
	end
end
puts b
