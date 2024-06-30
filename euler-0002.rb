#!/usr/bin/env ruby
fibonacci = []
fibonacci << 1
fibonacci << 2
while fibonacci[fibonacci.length - 1] <= 4000000 do
	fibonacci <<  fibonacci[fibonacci.length - 1] + fibonacci[fibonacci.length - 2]
end
if fibonacci[fibonacci.length - 1] > 4000000
	fibonacci.pop()
end
#puts fibonacci
add = 0
for f in fibonacci
	if f % 2 == 0
		add += f
	end
end
puts add
