# https://projecteuler.net/problem=2
defmodule PE2 do
    def fib(threshold, first, second) do
        third = first + second
        cond do
            third <= threshold and rem(third, 2) == 0 ->
                third + fib(threshold, second, third)
            third <= threshold ->
                fib(threshold, second, third)
            true ->
                0
        end
    end
end