array = [10]
array.each do |item|
  item += 5
  if (item <= 100)
    array.push(item)
  end
end
print array
