puts "Let's find out if your triangle is rectangular on three sides"
puts "Write the length of the first side:"
first_side = gets.chomp.to_i
puts "Write the length of the second side:"
second_side = gets.chomp.to_i
puts "Write the length of the third side:"
third_side = gets.chomp.to_i
if (first_side == second_side) && (third_side == first_side)
  puts "It's isosceles triangle!!!"
else
    array = [first_side, second_side, third_side].sort
    #Pythagorean theorem: c**2 = a**2 + b**2
    max_value_sqr = array[2]**2
    other_sides_sqr = array[0]**2 + array[1]**2
  if max_value_sqr == other_sides_sqr
    puts "Congratulations! your triangle is rectangular!"
  else
    puts "It's just a triangle :)"
  end
end
