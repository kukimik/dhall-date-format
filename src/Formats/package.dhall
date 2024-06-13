let Format =
        missing
          sha256:f2cc2def1128ae9e3b073912531f3a86052e6b81da69994a387bf8da401f1c85
      ? ../Format.dhall

let DateComponents =
        missing
          sha256:838b1cd41f59c2bf50fe2785453756dc54da24b76576752ec2bf29973d0a926b
      ? ../DateComponents.dhall

let translateMonth =
        missing
          sha256:4235a66e651a70a87c6ce74500dc029d5346125d200aedf4330d773669cc3196
      ? ./Helpers/translateMonth.dhall

let translateDay =
        missing
          sha256:3526a32abd0e340a7534d17d05d61ca5b6372a322b79b788a92a7fa0023f1f0f
      ? ./Helpers/translateDay.dhall

let fullEnglishMonthNames =
        missing
          sha256:06cf2d334654efc9a2d9ed26a424fae0ea04a156bd9cb744c13bc3e6ecacc2b5
      ? ./Helpers/Months/fullEnglishMonthNames.dhall

let shortEnglishMonthNames =
        missing
          sha256:7938c8298062d46c7620b0f7af1bce9a40fca4c140e4a5d9630b83f91467c950
      ? ./Helpers/Months/shortEnglishMonthNames.dhall

let shortEnglishOrdinals =
        missing
          sha256:2f1dc1e34d8b7e0d65c47004321ef6f7ac11b237ce543b918ce4435d6422a3e5
      ? ./Helpers/Days/shortEnglishOrdinals.dhall

let dropLeading0 =
        missing
          sha256:c152acc1f4329ba9542f140a23cf44f27b62c1e7472be5abe65b9bfb8994b93f
      ? ./Helpers/dropLeading0.dhall

let dropTwoFirstDigits =
        missing
          sha256:ab43d57b58dd51719fabfcde67ebda69f600b45834a3d2a115ffb3314772348e
      ? ./Helpers/dropTwoFirstDigits.dhall

let format =
        missing
          sha256:76a7136673ea42e9082ea7d34f8c2b05134cf0484a21aa859311a0b58d69cf70
      ? ../format.dhall

let YYYY/MM/DD
    : Format
    = λ(dc : DateComponents) → "${dc.year}/${dc.month}/${dc.day}"

let `DD.MM.YYYY`
    : Format
    = λ(dc : DateComponents) → "${dc.day}.${dc.month}.${dc.year}"

let `MM.DD.YYYY`
    : Format
    = λ(dc : DateComponents) → "${dc.month}.${dc.day}.${dc.year}"

let `MMMM D, YYYY`
    : Format
    = λ(dc : DateComponents) →
        "${translateMonth
             fullEnglishMonthNames
             dc.month} ${dropLeading0 dc.day}, ${dc.year}"

let `D MMM YYYY`
    : Format
    = λ(dc : DateComponents) →
        "${dropLeading0 dc.day} ${translateMonth
                                    shortEnglishMonthNames
                                    dc.month} ${dc.year}"

let `D MMMM YYYY`
    : Format
    = λ(dc : DateComponents) →
        "${dropLeading0 dc.day} ${translateMonth
                                    fullEnglishMonthNames
                                    dc.month} ${dc.year}"

let M/D/YYYY
    : Format
    = λ(dc : DateComponents) →
        "${dropLeading0 dc.month}/${dropLeading0 dc.day}/${dc.year}"

let M/D/YY
    : Format
    = λ(dc : DateComponents) →
        "${dropLeading0 dc.month}/${dropLeading0 dc.day}/${dropTwoFirstDigits
                                                             dc.year}"

let `the Dth of MMMM, YYYY`
    : Format
    = λ(dc : DateComponents) →
        "the ${translateDay
                 shortEnglishOrdinals
                 dc.day} of ${translateMonth
                                fullEnglishMonthNames
                                dc.month}, ${dc.year}"

let example0 = assert : format YYYY/MM/DD 1944-08-01 ≡ "1944/08/01"

let example1 = assert : format `DD.MM.YYYY` 1944-08-01 ≡ "01.08.1944"

let example2 = assert : format `MM.DD.YYYY` 1944-08-01 ≡ "08.01.1944"

let example3 = assert : format `MMMM D, YYYY` 1944-08-01 ≡ "August 1, 1944"

let example4 = assert : format `D MMM YYYY` 1944-08-01 ≡ "1 Aug 1944"

let example5 = assert : format `D MMMM YYYY` 1944-08-01 ≡ "1 August 1944"

let example6 = assert : format M/D/YYYY 1944-08-01 ≡ "8/1/1944"

let example7 = assert : format M/D/YY 1944-08-01 ≡ "8/1/44"

let example8 =
        assert
      : format `the Dth of MMMM, YYYY` 1944-08-01 ≡ "the 1st of August, 1944"

in  { YYYY/MM/DD
    , `DD.MM.YYYY`
    , `MM.DD.YYYY`
    , `MMMM D, YYYY`
    , `D MMM YYYY`
    , `D MMMM YYYY`
    , M/D/YYYY
    , M/D/YY
    , `the Dth of MMMM, YYYY`
    }
