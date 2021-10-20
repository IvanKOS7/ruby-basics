array = [0, 1]

for item in array
  item = array.push(array[-1] + array[-2])
  if array.last > 100
    break
  end
end
array.delete(array.last) 
print array
