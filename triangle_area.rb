#simple triangle draw
n = 4
br = "\n" * 2
puts "========================================"
puts "Let's calculate the area of a triangle !#{br}"
n = 4 # Set number of rows
i = 1

1.upto(n) do
  print ' ' * n
  print '*' * (2 * i -1)
  print "\n"
  n -= 1
  i += 1
end
print br
#============================================
puts "What is the base of the triangle?"
base = gets.chomp.to_i
puts "What is the height of the triangle?"
height = gets.chomp.to_i
area = 0.5 * base * height
puts "The area of ​​your triangle is: #{area}"
