import Debug.Trace (trace)
import Control.Monad (replicateM)

binToDec :: [Int] -> Int -> Int -> Int
binToDec bInput bExp bMemory
    | null bInput = bMemory
    | otherwise   = binToDec (init bInput) (succ bExp) (bMemory + ((last bInput) * 2^bExp))

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

getAllRoutes :: Int -> Int -> Int -> [[Int]] -> Int
getAllRoutes gMaximumExp gCounter routeCounter gListOfRoutes
    | gCounter >= gMaximum                      = routeCounter
    | countOnes gDTB 0 == (gMaximumExp `div` 2) = {-trace ((show gDTB) ++ " " ++ (show routeCounter)) $-} getAllRoutes gMaximumExp (succ gCounter) (succ routeCounter) (gListOfRoutes ++ [gDTB])
    | otherwise                                 = getAllRoutes gMaximumExp (succ gCounter) routeCounter gListOfRoutes
    where
        gDTB     = decToBin gCounter (gMaximumExp - 1) []
        gMaximum = (2^gMaximumExp)

allRoutes :: [[Integer]]
allRoutes = filter (\lst -> count 0 lst == 20) (replicateM 40 [0,1])
    where
        count x = length . filter (== x)


main :: IO()
main = do
    let a = 40
    let b = a `div` 2
    --print (getAllRoutes a ((2^b)-1) 0 [])
    print $ length (allRoutes)
