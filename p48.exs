# https://projecteuler.net/problem=48
defmodule PE48 do
    def modpower(base, pow, mod) do
        base = rem(base, mod)
        cond do
            pow == 0 -> 1
            rem(pow, 2) == 0 -> 
                half = modpower(base, div(pow, 2), mod)
                rem(half * half, mod)
            rem(pow, 2) == 1 ->
                half = modpower(base, div(pow, 2), mod)
                rem(half * half, mod) |> Kernel.*(base) |> rem(mod) 
        end
    end

    def solve_till(n, mod) do
        case n do
            0 -> 0
            n -> solve_till(n - 1, mod) + modpower(n, n, mod) |> rem(mod)
        end
    end
end