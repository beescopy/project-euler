sumDigits :: Integer -> Integer
sumDigits 0 = 0
sumDigits x = (x `mod` 10) + sumDigits (x `div` 10)

main :: IO()
main = do
    putStrLn (show (sumDigits (2^1000)))
