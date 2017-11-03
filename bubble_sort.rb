def bubble_sort array
    temp = nil
    i = 0
    j = 0
    while i <= (array.length - 2)
        j = i + 1
        while j <= (array.length - 1)
            if array[i] > array[j]
                temp = array[i]
                array[i] = array[j]
                array[j] = temp
            end
            j += 1
        end
        i += 1
    end
    array
end

def bubble_sort_by(array, &comp)  
    temp = nil
    i = 0
    j = 0
    while i <= (array.length - 2)
        j = i + 1
        while j <= (array.length - 1)
            if yield(array[i], array[j]) > 0
                temp = array[i]
                array[i] = array[j]
                array[j] = temp
            end
            j += 1
        end
        i += 1
    end
    array
end

result = bubble_sort_by ["hi","hello","hey"] do |left, right|
    left.length - right.length
end
puts result