let Days =
        missing
          sha256:ce1bd0a8eb935038500f51c3d8c64db3cba4b94c1010c24eb8421373190e8543
      ? ./Days.dhall

let applyAll =
        missing
          sha256:35816a75ca591818e135c2df9aae7db623ebb338dc7b313c2b4342dddb1fe15d
      ? ./applyAll.dhall

let translateDay
    : Days → Text → Text
    = λ(days : Days) →
        applyAll
          [ Text/replace "01" days._01
          , Text/replace "02" days._02
          , Text/replace "03" days._03
          , Text/replace "04" days._04
          , Text/replace "05" days._05
          , Text/replace "06" days._06
          , Text/replace "07" days._07
          , Text/replace "08" days._08
          , Text/replace "09" days._09
          , Text/replace "10" days._10
          , Text/replace "11" days._11
          , Text/replace "12" days._12
          , Text/replace "13" days._13
          , Text/replace "14" days._14
          , Text/replace "15" days._15
          , Text/replace "16" days._16
          , Text/replace "17" days._17
          , Text/replace "18" days._18
          , Text/replace "19" days._19
          , Text/replace "20" days._20
          , Text/replace "21" days._21
          , Text/replace "22" days._22
          , Text/replace "23" days._23
          , Text/replace "24" days._24
          , Text/replace "25" days._25
          , Text/replace "26" days._26
          , Text/replace "27" days._27
          , Text/replace "28" days._28
          , Text/replace "29" days._29
          , Text/replace "30" days._30
          , Text/replace "31" days._31
          ]

in  translateDay
