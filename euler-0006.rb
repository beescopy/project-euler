#!/usr/bin/env ruby
n = 100
sumOfSquares = 0
for i in 1..n
	sumOfSquares += i*i
end
#puts sumOfSquares
sum = 0
for i in 1..n
	sum += i
end
#puts sum*sum
puts sum*sum - sumOfSquares
