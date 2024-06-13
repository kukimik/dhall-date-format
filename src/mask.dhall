{-|
Generates a `Format` that works by substituting the following substrings of the
provided mask with data, in the following order:

* `DD` - two-digit day of the month, e.g. 02
* `D` - one-digit day of the month for days below 10, e.g. 2
* `MMMM` - month spelled out in English in full, e.g. March
* `MMM` - three-letter English abbreviation for month, e.g. Mar
* `MM` - two-digit month, e.g. 03
* `M` - one-digit month for months below 10, e.g. 3
* `YYYY` - four-digit year, e.g. 2024
* `YY` - two-digit year, e.g. 24
-}
let DateComponents =
        missing
          sha256:838b1cd41f59c2bf50fe2785453756dc54da24b76576752ec2bf29973d0a926b
      ? ./DateComponents.dhall

let Format =
        missing
          sha256:f2cc2def1128ae9e3b073912531f3a86052e6b81da69994a387bf8da401f1c85
      ? ./Format.dhall

let applyAll =
        missing
          sha256:35816a75ca591818e135c2df9aae7db623ebb338dc7b313c2b4342dddb1fe15d
      ? ./Formats/Helpers/applyAll.dhall

let translateMonth =
        missing
          sha256:4235a66e651a70a87c6ce74500dc029d5346125d200aedf4330d773669cc3196
      ? ./Formats/Helpers/translateMonth.dhall

let translateDay =
        missing
          sha256:3526a32abd0e340a7534d17d05d61ca5b6372a322b79b788a92a7fa0023f1f0f
      ? ./Formats/Helpers/translateDay.dhall

let fullEnglishMonthNames =
        missing
          sha256:06cf2d334654efc9a2d9ed26a424fae0ea04a156bd9cb744c13bc3e6ecacc2b5
      ? ./Formats/Helpers/Months/fullEnglishMonthNames.dhall

let shortEnglishMonthNames =
        missing
          sha256:7938c8298062d46c7620b0f7af1bce9a40fca4c140e4a5d9630b83f91467c950
      ? ./Formats/Helpers/Months/shortEnglishMonthNames.dhall

let dropLeading0 =
        missing
          sha256:c152acc1f4329ba9542f140a23cf44f27b62c1e7472be5abe65b9bfb8994b93f
      ? ./Formats/Helpers/dropLeading0.dhall

let dropTwoFirstDigits =
        missing
          sha256:ab43d57b58dd51719fabfcde67ebda69f600b45834a3d2a115ffb3314772348e
      ? ./Formats/Helpers/dropTwoFirstDigits.dhall

let format =
        missing
          sha256:76a7136673ea42e9082ea7d34f8c2b05134cf0484a21aa859311a0b58d69cf70
      ? ./format.dhall

let mask
    : Text → Format
    = λ(mask : Text) →
      λ(dc : DateComponents) →
        applyAll
          [ Text/replace "YY" (dropTwoFirstDigits dc.year)
          , Text/replace "YYYY" dc.year
          , Text/replace "M" (dropLeading0 dc.month)
          , Text/replace "MM" dc.month
          , Text/replace "MMM" (translateMonth shortEnglishMonthNames dc.month)
          , Text/replace "MMMM" (translateMonth fullEnglishMonthNames dc.month)
          , Text/replace "D" (dropLeading0 dc.day)
          , Text/replace "DD" dc.day
          ]
          mask

let example0 = assert : format (mask "MMM:D (YY)") 2024-06-03 ≡ "Jun:3 (24)"

in  mask
