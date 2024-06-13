let Months =
        missing
          sha256:f3d7d555826d119601250b62b7d0352729172c3f049da267dc10104fc4901459
      ? ./Months.dhall

let applyAll =
        missing
          sha256:35816a75ca591818e135c2df9aae7db623ebb338dc7b313c2b4342dddb1fe15d
      ? ./applyAll.dhall

let translateMonth
    : Months → Text → Text
    = λ(months : Months) →
        applyAll
          [ Text/replace "01" months._01
          , Text/replace "02" months._02
          , Text/replace "03" months._03
          , Text/replace "04" months._04
          , Text/replace "05" months._05
          , Text/replace "06" months._06
          , Text/replace "07" months._07
          , Text/replace "08" months._08
          , Text/replace "09" months._09
          , Text/replace "10" months._10
          , Text/replace "11" months._11
          , Text/replace "12" months._12
          ]

in  translateMonth
