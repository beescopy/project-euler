binToDec :: [Int] -> Int -> Int -> Int
binToDec bInput bExp bMemory
    | null bInput = bMemory
    | otherwise   = binToDec (init bInput) (succ bExp) (bMemory + ((last bInput) * 2^bExp))

-- maximum == 2^21 - 1 == 2.097.151
decToBin :: Int -> Int -> [Int] -> [Int]
decToBin bInput bExp bMemory
    | bExp      <= -1     = bMemory
    | 2^bExp    <= bInput = decToBin (bInput - 2^bExp) (bExp - 1) (bMemory ++ [1])
    | otherwise           = decToBin (bInput)          (bExp - 1) (bMemory ++ [0])

countOnes :: [Int] -> Int -> Int
countOnes cList cCounter
    | null cList      = cCounter
    | head cList == 1 = countOnes (tail cList) (succ cCounter)
    | otherwise       = countOnes (tail cList) (cCounter)


getAllRoutes :: Int -> Int -> [[Int]] -> [[Int]]
getAllRoutes gMaximum gCounter gListOfRoutes
    | gCounter >= gMaximum      = gListOfRoutes
    | countOnes gDTB 0 == 10    = getAllRoutes gMaximum (succ gCounter) (gListOfRoutes ++ [gDTB])
    | otherwise                 = getAllRoutes gMaximum (succ gCounter) gListOfRoutes
    where
        gDTB = decToBin gCounter 20 []

main :: IO()
main = do
    print (binToDec [1,1,0,0,0,1] 0 0)
    print (binToDec [1,1,0,0] 0 0)
    print (binToDec [1,0,1,0] 0 0)
    print (binToDec [1,0,0,1] 0 0)
    print (binToDec [0,1,1,0] 0 0)
    print (binToDec [0,1,0,1] 0 0)
    print (binToDec [0,0,1,1] 0 0)
    print (decToBin 1048576 20 [])
    print (countOnes [1,0,0] 0)
    print (countOnes (decToBin 31 20 []) 0 == 5)
    print (length (getAllRoutes (2^20) 1 []))
