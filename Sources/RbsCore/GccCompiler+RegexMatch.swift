import RegexBuilder

extension GccCompiler{

    static let Prefix = Regex{
        ChoiceOf{
            "gcc"
            "g++"
        }
    }
    static let VersionSuffix =   Regex{
        Optionally{
            Capture{
                "-"
                OneOrMore{
                    .digit
                }
            }
        }
    }


}