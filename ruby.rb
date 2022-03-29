# OBJECT PATTERN MATCH
# object pattern match i.e., Integer === 33; does 33 belong in integer? Returns true.
# does not work the other way round i.e., 33 === integer; integer does not belong in 33.
input = 33

case input
in String then puts 'this is a string'
in Integer then puts 'this is an integer'
end

# VARIABLE PATTERNS
# variable patterns - assign a value to a local variable - it will overwrite existing values!
age = 25

case age
in a 
  puts a       # assigns value of case (age) to variable a
end

case 35
in age
  puts age     # assigns value of case (35) to variable age
end
 
puts "age is now #{age}"

# can use the pin operator ^ to compare variable value, instead of assign value
# no  match
case 40
in ^age
else
  puts "no match"
end

# match
case 35
in ^age
  puts "it's a match"
else
  puts "no match"
end

# Alternative pattern match - check if multiple conditions match input
case 3
in 2|3|4
  puts :match
end

case "c"
in 'a'|1|'b'|2|'c'|3
  puts :match
end

# Guard conditions - makes pattern match only if condition is met
variable = true

case 3
in 2|3|4 if variable
  puts "match because gaurd condition met"
end

# MATCHING ARRAYS
# Array pattern matches must match whole array, but there are ways to handle elements for flexibility
# at the most basic level, match against the same number of elements
array_one = ['a', 'b', 'c']

case array_one
in [1, 2, 3]
  puts "no match"
in ['a', 'b', 'c']
  puts "arrays match"
end

# this is using '===' so can match using object
case array_one
in [String, String, String]
  puts 'this array has 3 strings'
end

# can only match an equal number of elements
case array_one
in [String, String]
  puts 'there are two strings'
else
  puts 'this match failed'
end

# However you can match against only part of an array using '*'
case array_one
in [String, String, *]
  puts 'there are two strings'
else
  puts 'this match failed'
end

# the splat '*' can be placed anywhere to match against multiple elements
array_two = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

case array_two
in [*, Integer, Integer, *]
  puts 'there are two integers'
end

# you can also use more than one match type e.g., class and value
case array_two
in [*, Integer, Integer, 9, 10]
  puts 'there are two integers and a 9 and 10'
end

# you can also add the values matched against the splat * to a variable to return them
case array_two
in [*splat, Integer, Integer, 9, 10]
  print splat
end

# if you want to match an index but don't care about the value, use '_'
case array_two
in [_,_,_,_,_,_,_,8,9,10]
  puts "\nmatchy poos"
end

# use a guard clause 
array_three = [3,9]

case array_three
in [a, b] if b == a*a
  puts a
  puts b
end

# can match against nested arrays and assign values to local variables
array_four = ['a','b','c',[1,2,3]]

case array_four
in [_,_,_,[x,y,z]]
  puts "#{x}, #{y}, #{z}"
end

# can match against nested arrays, assign value to local variable, and use As Pattern to assign array to variable
case array_four
in [_,_,_,[Integer,a,b] => c]
puts "#{a} and #{b}"
print c
end

# MATCHING HASHES
# you can match actual values of a hash

case { a: 'apple', b: 'banana'}
in {a: 'arlington', b: 'biden'}
  puts 'no match'
in { a: 'apple', b: 'banana'}
 puts "\nit is a match, sir"
end

# and assign values to local variables
case { a: 'apple', b: 'banana'}
in { a: x, b: y}
  puts "x is #{x} and y is #{y}"
end

# or you can omit the local variables in the pattern altogether - per Ruby hash convention 
case { a: 'analysis', b: 'boron' }
in { a:, b:}
  puts "#{x} and #{y}"
end

# use double splat to show the rest of a hash
case { a: 'analysis', b: 'boron', c: 'chard' }
  in { a: 'analysis', **rest}
    puts rest
  end

# unlike arrays, hashes will match if there is only a partial match
case { a: 'analysis', b: 'boron', c: 'chard' }
in { a: 'analysis' }
  puts 'matchy'
in { a: 'analysis', b: 'boron', c: 'chard' }
  puts 'this will never be reached'
end

# use '**nil' to ensure you match exactly
case { a: 'analysis', b: 'boron', c: 'chard' }
in { a: 'analysis', **nil }
  puts 'matchy'
in { a: 'analysis', b: 'boron', c: 'chard' }
  puts 'now this will be reached, thanks nil'
end

# As pattern match (=>) is used to assign an entire hash match to a variable
case { a: 'angle', b: 'bolder'}
in { a: 'angle' } => hash
puts hash
end


