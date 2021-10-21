
hash = {}
total_sum = [0]
loop do
  puts "Enter product name: "
  product_name = gets.chomp
break if product_name == "stop"
  puts "Price: "
  price = gets.chomp.to_f
  puts "Enter amount of product: "
  amount = gets.chomp.to_f
  value_hash = {}
  value_hash.store(price, amount)
  hash.store(product_name, value_hash)
  total = price * amount
  puts "Total price increased by: +$#{total}"
  total_sum.push(total)
end
#print hash
total_order = total_sum.sum
print "GRAND TOTAL: $#{total_order}"
