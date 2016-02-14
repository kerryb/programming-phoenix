fizzbuzz_int = fn
  0, 0, _ -> "FizzBuzz"
  0, _, _ -> "Fizz"
  _, 0, _ -> "Buzz"
  _, _, a -> a
end

fizzbuzz = fn n -> fizzbuzz_int.(rem(n, 3), rem(n, 5), n) end

for n <- 1..100, do: IO.puts fizzbuzz.(n)
