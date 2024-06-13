{-|
Year, month and day represented as `Text` values. Values of this type
are not meant to be constructed by hand. You should use [`./parse.dhall`](./parse.dhall.html)
instead. If you decide to construct them manually, it is up to you to ensure
that the data is correct.
-}
let DateComponents = { year : Text, month : Text, day : Text } in DateComponents
