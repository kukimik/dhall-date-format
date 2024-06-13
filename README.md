Utilities for formatting `Date`s as `Text` in the [Dhall](https://dhall-lang.org/)
configuration language.

## Usage example

```dhall
let DF = ./src/package.dhall
let F = DF.Formats

in
  [DF.format F.`MM.DD.YYYY` 1991-09-17
  ,DF.format F.`the Dth of MMMM, YYYY` 1990-04-01
  ,DF.format (DF.mask "D@MMMM[YY]") 1970-01-01
  ]
```

evaluates to

```dhall
[ "09.17.1991", "the 1st of April, 1990", "1@January[70]" ]
```

## Available formats

The formats provided by the library all live in `./src/Formats/package.dhall`.

It is easy to implement your own format; see the source code of the existing
formats and proceed analogously. You may also use `./src/mask.dhall` to create
a simple format using a `Text` mask.