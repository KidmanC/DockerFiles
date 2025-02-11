def countingSort(array):
    size = len (array)
    output = [0] * size

    count = [0] * (max(array) + 1)

    for i in range(0, size):
        count[array[i]] += 1
    
    for i in range (1, max(array) + 1):
        count[i] += count[i - 1]

    i = size - 1
    while i >= 0:
        output[count[array[i]] - 1] = array[i]
        count[array[i]] -= 1
        i -= 1
    
    for i in range(0, size):
        array[i] = output[i]
    
data = [4, 2, 2, 8, 3, 3, 1]
countingSort(data)
x = 'Python\\python_output.txt'
with open(x, 'w') as file:
    for i in data:
        file.write(str(i)+ '\n')
#print(data)