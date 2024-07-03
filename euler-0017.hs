chopLead :: Int -> Int
chopLead a
    | a < 10 = 0
    | otherwise = (read (tail (show a)))

thouHun :: Int -> Int -> String -> String
thouHun a n name = (numberToWords (a `div` (10^n))) ++ name ++ (\x -> if x > (x `div` (10^n))*(10^n) then "and" else "") a

prefixNumberToWords :: Int -> String
prefixNumberToWords a
    | a == 9 = "nine"
    | a == 8 = "eigh"
    | a == 7 = "seven"
    | a == 6 = "six"
    | a == 5 = "fif"
    | a == 4 = "for"
    | a == 3 = "thir"
    | a == 2 = "twen"

numberToWords :: Int -> String
numberToWords a
    | a >= 1000 = thouHun a 3 "thousand" ++ (numberToWords (chopLead a))
    | a >= 100  = thouHun a 2 "hundred" ++ (numberToWords (chopLead a))
    | a >= 20 = (prefixNumberToWords (a `div` 10)) ++ "ty" ++ (numberToWords (chopLead a))
    | a >= 13 = (prefixNumberToWords (a `mod` 10)) ++ (\x -> if x==18 then "t" else "" ) a ++ "teen"
    | a == 12 = "twelve"
    | a == 11 = "eleven"
    | a == 10 = "ten"
    | a == 9 = "nine"
    | a == 8 = "eight"
    | a == 7 = "seven"
    | a == 6 = "six"
    | a == 5 = "five"
    | a == 4 = "four"
    | a == 3 = "three"
    | a == 2 = "two"
    | a == 1 = "one"
    | otherwise = ""

flatten :: [String] -> [Char]
flatten [] = ""
flatten (x:xs) = x ++ flatten xs

main :: IO ()
main = do
    print $ sum (map length [numberToWords a | a <- [1..1000]])
