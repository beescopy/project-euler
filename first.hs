-- Comment

{-
	more
	comments
-}

-- learnyouahaskell.com

-- IMPORTS
import Data.List

-- TYPES
-- Bool, Int (bounded), Integer (unbounded), Float, Double, Char, [Char], Tuple


-- :: Bool
-- True and False
trueAndFalse = True && False
trueOrFalse = True || False
notTrue = not(True)

-- :: Int
-- Whole number -2^63 to 2^63
maxInt = maxBound :: Int

-- :: Integer
-- Unbounded Whole number
numFive :: Integer -- optional
numFive = 5

-- :: Float
-- one point precision
myFloat :: Float
myFloat = 5.6 + 7.9

-- :: Double
-- eleven point precision
myDouble :: Double -- optional
myDouble = 1.55555555555 + 0.00000000001

-- :: Char
-- single unicode character
singleChar = 'a'
automaticListOfChars :: [Char] -- optional
automaticListOfChars = "Hello"
myJob = ['I','T']



--- Math

addNum = 1 + 2
subNum = 1 - 2
multNum = 1 * 2
divNum = 1 / 2
modNum = mod 9 2
modNum2 = 9 `mod` 2
addNeg = 4 + (-4)

-- pi, exp, log, sin, cos, tan, asin, acos, atan

truncDouble = truncate myDouble
-- round
-- ceiling
-- floor

numList = [1,2,3]
rangeList = [1..99]
alphaList = ['a'..'z']
evenNums = [2,4..20]
oddNums = [1,3..20]
oddAlpha = ['a','c'..'z']

sumNumList = sum [1..100]
-- product

elemList = elem 5 numList
-- -> True

firstList = [1..5]
secondList = [6..99]
combinedLits = firstList ++ secondList

-- maximum List
-- minimum List


myZip = zipWith (+) [1..5] [6..10]

infOdds = [1,3..]
takeOdds = take 20 infOdds
infFives = repeat 5
takeFives = take 20 infFives
replFives = replicate 20 5
cycleList = cycle [1..99]


mapList = map (*2) [1..10]
-- do to every member

unorderedList = [9,5,7,3,5,7,0]
sortList = sort unorderedList



