puts "Write a"
a = gets.chomp.to_i
puts "Write b"
b = gets.chomp.to_i
puts "Write c"
c = gets.chomp.to_i
d = b**2 - 4 * a * c


if d > 0
  #х1 = (–b + C)/(2a) и x2 = (–b – C)/(2a)
  sqr_d = Math.sqrt(d)
  puts "D = #{d}"
  x1 = (-b + sqr_d)/(2 * a)
  x2 = (-b - sqr_d)/(2 * a)
  puts "x1 = #{x1}, x2 = #{x2}"
elsif d == 0
  x = (-b)/(2 * a)
  puts "X1 = X2 = #{x}"
else
  puts "The roots of the equation cannot be calculated D < 0"
end
