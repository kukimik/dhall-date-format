let Format =
        missing
          sha256:f2cc2def1128ae9e3b073912531f3a86052e6b81da69994a387bf8da401f1c85
      ? ./Format.dhall

let parse =
        missing
          sha256:ded6a9dbdc5d1fc23695509d247b47dca2d8c8985c8d3d8b270c402e81721846
      ? ./parse.dhall

let format
    : Format → Date → Text
    = λ(f : Format) → λ(date : Date) → f (parse date)

in  format
