# https://projecteuler.net/problem=16
defmodule PE16 do 

    def multiply_by_2(dlist, carry) do
        case dlist do 
            [] when carry > 0 ->
                [carry]
            [] ->
                []
            [head | tail] ->
                value = head * 2 + carry
                if value > 9 do
                    [rem(value, 10) | multiply_by_2(tail, div(value, 10)) ]
                else
                    [value | multiply_by_2(tail, 0)] 
                end
        end
    end

    def multiply_times(n) do
        if n > 0 do
            multiply_by_2(multiply_times(n - 1), 0)
        else    
            [1]
        end
    end

    def get_sum_power_2(n) do
        Enum.sum(multiply_times(n))
    end
end
