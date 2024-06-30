#!/usr/bin/env ruby
dividersUpTo = 20
cap = 2
for i in 3..dividersUpTo
	cap *= i
end
for i in 1..cap
	#puts "testing " + String(i)
	if i % 10000000 == 0
		#puts String(i) + ".."
	end
	for j in 1..dividersUpTo
		if i % j != 0
			#puts String(i) + " is not divisible by " + String(j)
			break
		end
		if j == dividersUpTo
			puts String(i)# + " is divisible by 1 through " + String(dividersUpTo)
			return
		end
	end
end
