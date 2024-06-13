{-|
Drops a leading `0` character from a `Text` value. The `Text` value should not
contain the character `^`.

Meant to be used with day/month components of a date.
-}
let dropLeading0
    : Text → Text
    = λ(t : Text) → Text/replace "^" "" (Text/replace "^0" "" "^${t}")

let example0 = assert : dropLeading0 "01" ≡ "1"

let example1 = assert : dropLeading0 "10" ≡ "10"

in  dropLeading0
