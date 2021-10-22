array = [0, 1]

for item in array
  item = array.push(array[-1] + array[-2])
break if array.last > 100
end
array.delete(array.last)
print array
