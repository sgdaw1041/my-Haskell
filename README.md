# Notes on learning Haskell programming 
_more-or-less using_ **Haskell and Crypto Mongolia 2020** [videos]

sponsored by Alejandro Garicia
with: Dr. Lars Brünjes Director of Education at IOHK, and Dr. Andres Löh Partner at Well-Typed

**2.4.0 lookup tables**
1. creates lookup tables using type synonym
  - design for lookup tables is a list of pair type
  - suggests re-writing type Table using data constructor and newtype
2. creates simple model of bank account transactions as
 - use Table type to hold a list of transactions
 - an Accounts type to hold state of a bank's transactions
 - a Transaction type using record-syntax of a transaction
 - and, a processTransaction function to insert two entries per transaction
 - - one pair type from-account and second pair type to-account
 - - formula: insert fromBal (fbalance - x)  (insert toBal (tbalance + x) list-of-pairs)

[//]: # 
   [videos]: <https://www.youtube.com/playlist?list=PLJ3w5xyG4JWmBVIigNBytJhvSSfZZzfTm>


