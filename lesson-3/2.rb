array = [10]
array.each do |item|
  item += 5
array.push(item) if item <= 100
end
print array
