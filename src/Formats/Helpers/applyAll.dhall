let applyAll
    : List (Text → Text) → Text → Text
    = λ(fs : List (Text → Text)) →
      λ(t : Text) →
        List/fold
          (Text → Text)
          fs
          Text
          (λ(f : Text → Text) → λ(s : Text) → f s)
          t

in  applyAll
