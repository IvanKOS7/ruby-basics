puts "What`s your name?"
name = gets.chomp
puts "Write your height here:"
height = gets.chomp.to_i
ideal_weight = (height - 110)*1.15
if ideal_weight > 0
  puts "Hi, #{name} ! Your IDEAL weight is: #{ideal_weight}"
else
  puts "Your weight is already optimal!"
end
