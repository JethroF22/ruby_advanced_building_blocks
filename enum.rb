module Enumerable
    def my_each
        i = 0
        self.length.times do
            yield(self[i])
            i += 1            
        end
        self
    end

    def my_each_with_index
        i = 0
        self.length.times do
            yield(self[i], i)
            i += 1            
        end
        self
    end

    def my_select
        i = 0
        while i < self.length
            element = self[i]
            if !yield(element)
                self.delete(element)
            end
            i += 1
        end
        self
    end

    def my_all?
        self.my_each do |element|
            if !yield(element)
                return false
            end
        end
        true
    end

    def my_any?
        self.my_each do |element|
            if yield(element)
                return true
            end
        end
        false
    end

    def my_none?
        !self.my_all?
    end

    def my_count *num
        count = 0
        if !block_given?
            puts num[0]
            if num[0] != nil
                self.my_each do |element|
                    count += 1 if element == num[0]
                end
                return count
            else
                return self.size
            end
        else
            self.my_each do |element|
                if yield(element)
                    count += 1
                end
            end
            count
        end
    end

    def my_map
        self.my_each_with_index do |element, element_index|
            self[element_index] = yield(element)
        end
        self
    end

    def my_inject value=:value
        if value.kind_of? Symbol
            value = self[0]
            self[1..-1].my_each do |element|
                value = yield(value, element)
            end
        else
            self.my_each do |element|
                value = yield(value, element)
            end
        end
        value
    end
end

def multiply_els array
    array.my_map do |element|
        
    end
end

arr = [1, 0, 3, 0, 5]
result = arr.my_inject(10) do |prev, current|
    prev + current
end
p result
p arr