let map =
        missing
          sha256:dd845ffb4568d40327f2a817eb42d1c6138b929ca758d50bc33112ef3c885680
      ? ./map.dhall

let DateComponents =
        missing
          sha256:838b1cd41f59c2bf50fe2785453756dc54da24b76576752ec2bf29973d0a926b
      ? ./DateComponents.dhall

let parse
    : Date → DateComponents
    = λ(date : Date) →
        let days =
              [ "01"
              , "02"
              , "03"
              , "04"
              , "05"
              , "06"
              , "07"
              , "08"
              , "09"
              , "10"
              , "11"
              , "12"
              , "13"
              , "14"
              , "15"
              , "16"
              , "17"
              , "18"
              , "19"
              , "20"
              , "21"
              , "22"
              , "23"
              , "24"
              , "25"
              , "26"
              , "27"
              , "28"
              , "29"
              , "30"
              , "31"
              ]

        let months =
              [ "01"
              , "02"
              , "03"
              , "04"
              , "05"
              , "06"
              , "07"
              , "08"
              , "09"
              , "10"
              , "11"
              , "12"
              ]

        let remove =
              λ(needle : Text) →
              λ(haystack : Text) →
                Text/replace needle "" haystack

        let removeAll
            : List Text → Text → Text
            = λ(needles : List Text) →
              λ(haystack : Text) →
                List/fold Text needles Text remove haystack

        let ParseResult = { res : Text, rem : Text }

        let markPrefix
            : Text → Text
            = λ(t : Text) → "^" ++ t

        let markSuffix
            : Text → Text
            = λ(t : Text) → t ++ "\$"

        let dropPrefix
            : Text → Text → Text
            = λ(prefix : Text) →
              λ(t : Text) →
                remove (markPrefix prefix) (markPrefix t)

        let dropSuffix
            : Text → Text → Text
            = λ(suffix : Text) →
              λ(t : Text) →
                remove (markSuffix suffix) (markSuffix t)

        let getOneOfPrefixes
            : List Text → Text → ParseResult
            = λ(ts : List Text) →
              λ(s : Text) →
                let withoutPrefix =
                      removeAll (map Text Text markPrefix ts) (markPrefix s)

                in  { res = dropSuffix withoutPrefix s, rem = withoutPrefix }

        let getOneOfSuffixes
            : List Text → Text → ParseResult
            = λ(ts : List Text) →
              λ(s : Text) →
                let withoutSuffix =
                      removeAll (map Text Text markSuffix ts) (markSuffix s)

                in  { res = dropPrefix withoutSuffix s, rem = withoutSuffix }

        let dayResult = getOneOfSuffixes days (Date/show date)

        let monthResult = getOneOfSuffixes months (dropSuffix "-" dayResult.rem)

        let year = dropSuffix "-" monthResult.rem

        in  { year, month = monthResult.res, day = dayResult.res }

in  parse
