properDivisors :: Int -> [Int]
properDivisors x = [y | y <- [1..x-1], x `mod` y==0]

d :: Int -> Int
d x = sum (properDivisors x)

getAmicable :: Int -> Maybe Int
getAmicable x
    | (x == (d (d x))) && (x /= (d x)) = Just (d x)
    | otherwise = Nothing

amicableToTenK = [x | x <- [1..10000], getAmicable x /= Nothing]

main :: IO()
main = do
    print (sum amicableToTenK)
