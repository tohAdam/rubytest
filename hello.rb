puts "Welcome to the Ruby Basics Script!"

print "Please enter your name: "
name = gets.chomp

puts "Hello, #{name}!"

print "How many times would you like me to greet you? "
count = gets.chomp.to_i

if count <= 0
  puts "That's not a positive number! I won't greet you then."
elsif count > 10
  puts "That's too many times! Let's just stick to 3."
  count = 3
end

count.times do |i|
  puts "#{i + 1}: Hello again, #{name}!"
end

puts "Goodbye!"
