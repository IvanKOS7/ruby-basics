puts "Let's find out if your triangle is rectangular on three sides"
puts "Write the length of the first side:"
first_side = gets.chomp.to_i
puts "Write the length of the second side:"
second_side = gets.chomp.to_i
puts "Write the length of the third side:"
third_side = gets.chomp.to_i
#Проверям равносторонний треугольник или нет
if (first_side == second_side) && (third_side == first_side)
  puts "It's isosceles triangle!!!"
#Если нет то:
else
  array = []
  array << first_side << second_side << third_side
  #first_value, second_value, max_value = [first_side, second_side, third_side].sort

#print array
#max_value = potentially hypotenuse
#сюда будет сохраняться максимальное значение
  max_value = 0
#цикл проходит по всем элементам массива и записывает в max_value
#каждый раз значение больше(если оно есть)
  for item in array do
    if item > max_value
      max_value = item
    end
  end
#удаляем максимальное значение из массива
  array.delete(max_value)
#puts array
  max_value_sqr = max_value ** 2
  other_sides_sqr = array[0]**2 + array[1]**2
#puts "SQR of other sides: #{other_sides_sqr}, SQR of potentially hypotenuse: #{max_value_sqr}"
#пишем оператор сравнения
#c^2 = a^2 + b^2
  if max_value_sqr == other_sides_sqr
    puts "Congratulations! your triangle is rectangular!"
  else
    puts "It's just a triangle :)"
  end
end
