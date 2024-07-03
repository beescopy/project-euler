factorial :: Integer -> Integer
factorial 1 = 1
factorial n = n * (factorial (n - 1))

choose :: Integer -> Integer -> Integer
choose a b = (factorial a) `div` ((factorial b) * (factorial (a - b)))

main :: IO()
main = do
    print $ choose 40 20
