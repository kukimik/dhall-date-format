{-|
Converts year in the YYYY format to YY (drops first two digits).
-}
let dropTwoFirstDigits
    : Text → Text
    = λ(s : Text) →
        let dropPrefixDigit
            : Text → Text
            = λ(t : Text) →
                Text/replace
                  "^0"
                  ""
                  ( Text/replace
                      "^1"
                      ""
                      ( Text/replace
                          "^2"
                          ""
                          ( Text/replace
                              "^3"
                              ""
                              ( Text/replace
                                  "^4"
                                  ""
                                  ( Text/replace
                                      "^5"
                                      ""
                                      ( Text/replace
                                          "^6"
                                          ""
                                          ( Text/replace
                                              "^7"
                                              ""
                                              ( Text/replace
                                                  "^8"
                                                  ""
                                                  (Text/replace "^9" "" "^${t}")
                                              )
                                          )
                                      )
                                  )
                              )
                          )
                      )
                  )

        in  dropPrefixDigit (dropPrefixDigit s)

let example0 = assert : dropTwoFirstDigits "2024" ≡ "24"

in  dropTwoFirstDigits
