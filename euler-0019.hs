yearCodeExtra y
    | (y `div` 1000) == 1 = 1 -- +1 if it's before 2000
    | otherwise           = 0

monthCode = [6,2,2,5,0,3,5,1,4,6,2,4]

yearCode :: Int -> Int
yearCode y = ((x + (x `div` 4)) `mod` 7) + (yearCodeExtra y)
    where
        x = read (drop 2 (show y))

dayCode :: [Int] -> Int
dayCode [y, m, d]
    | (isLeapYear y) && (m <= 2) = (d - 1)
    | otherwise = d

weekDay :: [Int] -> Int
weekDay [y, m, d] = ((yearCode y) + (monthCode!!(m - 1)) + (dayCode [y, m, d])) `mod` 7

isLeapYear :: Int -> Bool
isLeapYear y
    | (((y `mod` 4) == 0) && (((y `mod` 100) /= 0) || (((y `mod` 400) == 0)))) = True
    | otherwise                                                                = False

isLastDay :: [Int] -> Bool
isLastDay [y,m,d]
    | (isLeapYear y) && m==2 && d==29 = True
    | m==2 && d==28 = True
    | m==4 && d==30 = True
    | m==6 && d==30 = True
    | m==9 && d==30 = True
    | m==11 && d==30 = True
    | d==31 = True
    | otherwise = False

isLastMonth :: Int -> Bool
isLastMonth m
    | m==12     = True
    | otherwise = False

nextDate :: [Int] -> [Int]
nextDate [y, m, d]
    | (isLastDay [y, m, d]) && (isLastMonth m) = [succ y, 1, 1]
    | (isLastDay [y, m, d]) && (not (isLastMonth m)) = [y, succ m, 1]
    | otherwise = [y, m, succ d]

century :: [Int] -> Int -> Int
century [y,m,d] countSpecialSundays
    | [y,m,d] == [2001,1,1] = countSpecialSundays
    | (d==1) && ((weekDay [y, m, d]) == 0) = century (nextDate [y,m,d]) (succ countSpecialSundays)
    | otherwise = century (nextDate [y,m,d]) countSpecialSundays

main :: IO()
main = do
    print (century [1901,1,1] 0)
