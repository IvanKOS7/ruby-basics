puts "Enter day: "
day = gets.chomp.to_i
puts "Enter month: "
month = gets.chomp.to_i
puts "Enter year: "
year = gets.chomp.to_i

if day > 31 || month > 12
  puts "Enter the correct date format!"
  exit
end
if year%4 != 0 || (year%100 == 0 && year%400 != 0)
  array_days = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
else
  array_days = [31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
  puts "Leap year!"
end
  total_days = array_days.sum
  day_number = array_days.take(month-1).sum + day
  print "Day number: #{day_number} of #{total_days}"
