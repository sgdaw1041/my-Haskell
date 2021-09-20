-- modeling a lookup table
type Table k v = [(k, v)]

--Interface for type
empty :: Table k v
empty = []

insert :: k -> v -> Table k v  -> Table k v
insert k v tabl = (k, v) : tabl   -- Note: can install duplicate keys & values


-- NOTE: here, k :: Int and v :: String
table1 = insert 42 "Chain"  empty
table2 = insert 3 "Curly" table1

delete :: Eq k => k -> Table k v -> Table k v
delete k tabl = filter ( \(k', _) -> not (k == k') ) tabl -- deletes all instances of k

-- NOTE: lookup exists in Prelude
lookup' :: Eq k => k -> Table k v -> Maybe v
lookup' _  []              = Nothing
lookup' k ((k', v'): tabl) 
  | k' == k                = Just v'
  | otherwise              = lookup' k tabl


data Transaction =
  Transaction 
    { trAmount :: Amount
    , trFrom :: Account
    , trTo :: Account
    }
  deriving (Eq, Show)

type Amount  = Int
type Account = String

-- record syntax. Order of arguments is not important; using key label
trans1 = Transaction {trAmount = 100, trFrom = "Larry", trTo = "Curly" }

-- 1. using record syntax to select a field
-- trAmount trans1 
-- trTo trans1

-- 2. update a record - Note immutability of trans1
trans2 =  trans1 {trAmount = 10 } 


-- Maybe utility extract v
fromMaybe :: a -> Maybe a -> a
fromMaybe def Nothing  = def
fromMaybe  _  (Just a) = a 

-- modeling state of bank as Table from  Accounts to Amounts
--   NOTE: here Account :: String, and Amount :: Int
type Accounts = Table Account Amount

processTransaction :: Transaction -> Accounts -> Accounts
-- WITHOUT record syntax: processTransaction (Transaction x f t ) as =
--  NOTE: here insert requires String Int ordering
processTransaction (Transaction {trAmount = x, trFrom = f, trTo = t} ) as =
  let fOld = fromMaybe 0 (lookup' f as )
      tOld = fromMaybe 0 (lookup' t as )
  in insert f (fOld - x) (insert t (tOld + x) as ) 

-- processTransaction
table10 = insert "Humphrey" 100 (insert "John Huston" 300 empty )
trans10 = Transaction {trAmount = 1, trFrom = "Humphrey", trTo = "Peter" }
ptrans = processTransaction trans10 table10

