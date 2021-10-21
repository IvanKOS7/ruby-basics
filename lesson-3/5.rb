
puts "Enter day: "
@day = gets.chomp.to_i
puts "Enter month: "
@month = gets.chomp.to_i
puts "Enter year: "
@year = gets.chomp.to_i

if @day <= 31 && @month <= 12
  if @year%4 != 0
    array_days = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
  else
    array_days = [31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
    puts "Leap year!"
  end
  array_month = (1..12).to_a
  date_hash = array_month.zip(array_days).to_h
  #puts date_hash
  total_days = date_hash.values.sum
  @month_item = @month - 1
  arr = [0]
  (1..@month_item).each do |x|
    arr.push(date_hash[x])
  end
  #print arr
  day_number = arr.sum + @day
  print "Day number: #{day_number} of #{total_days}"
else
  puts "Enter the correct date format!"
end
