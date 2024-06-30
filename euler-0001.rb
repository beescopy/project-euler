#!/usr/bin/env ruby
numbers = []
j = 999
for i in 0..j
  if i % 3 == 0
    numbers << i
    next
  end
  if i % 5 == 0
    numbers << i
    next
  end
end
#puts numbers
add = 0
for n in numbers
  add += n
end
puts add
