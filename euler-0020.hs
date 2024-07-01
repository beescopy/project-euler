sumDigits :: Integer -> Integer
sumDigits 0 = 0
sumDigits x = (x `mod` 10) + sumDigits (x `div` 10)

factorial :: Integer -> Integer
factorial 1 = 1
factorial x = x * (factorial (x - 1))

main :: IO()
main = do
    print (sumDigits (factorial 100))
