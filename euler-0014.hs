collatz :: Int -> Int
collatz n
    | n `mod` 2 == 0 = n `div` 2
    | otherwise = 3 * n + 1

collatzChainLength :: Int -> Int -> Int
collatzChainLength n x
    | n == 1 = x
    | otherwise = collatzChainLength (collatz n) (x + 1)

biggestCollatzChainLength :: [(Int, Int)] -> (Int, Int)
biggestCollatzChainLength [tup] = tup
biggestCollatzChainLength ((n1, c1) : rest) = getMax rest (n1, c1)
    where
        getMax [] maxTup = maxTup
        getMax ((n, c) : rest) (maxN, maxC)
            | c > maxC = getMax rest (n, c)
            | otherwise = getMax rest (maxN, maxC)

listOfAllCollatzChainLengthsUpTo :: Int -> Int -> [(Int, Int)] -> [(Int, Int)]
listOfAllCollatzChainLengthsUpTo a n savedList
    | a > n = savedList
    | otherwise = savedList ++ listOfAllCollatzChainLengthsUpTo (a + 1) n [(a + 1, collatzChainLength (a + 1) 1 )]

main :: IO ()
main = do
    print (collatzChainLength 9 1)
    print (listOfAllCollatzChainLengthsUpTo 1 100 [(0,0)])
    print (biggestCollatzChainLength (listOfAllCollatzChainLengthsUpTo 1 999999 [(0,0)]))

