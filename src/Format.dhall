let DateComponents =
        missing
          sha256:838b1cd41f59c2bf50fe2785453756dc54da24b76576752ec2bf29973d0a926b
      ? ./DateComponents.dhall

let Format = DateComponents → Text

in  Format
