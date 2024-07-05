import RegexBuilder
import Path

protocol Compiler {
    var version: String { mutating get} 
    var path: Path {get}

    associatedtype RegexExpr
    var matchTemplate: Regex<RegexExpr> {get}
}

struct GccCompiler : Compiler {

    let path: Path
        var matchTemplate: Regex = Regex{
        Anchor.startOfLine
        Prefix
        VersionSuffix
        Anchor.endOfLine
    }
    lazy var version: String = {
        let output = try? CommandLine.run(command: "\(path.string) -v gcc")
        var stdout: String;

        guard let output = output else {
            return "Unknown"
        }
        if !output.stderr.isEmpty || output.code != 0 {
            return "Unknown"
        }
        stdout = output.stdout
        let gccVersionRegex = Regex{
                    Repeat(2...2){
                        OneOrMore(.digit)
                        "."
                    }
                    OneOrMore(.digit)
                }
        let versionComponents = stdout.split(separator: "\n" )
                    .filter{ $0.contains(gccVersionRegex) }
                    .first ?? "Unknown"
        if versionComponents == "Unknown"{
            return "Unknown"
        }
        let version = versionComponents
                        .split(separator: " ")
                        .filter { $0.contains(gccVersionRegex) }.first ?? "Unknown"

                    
        return String(version)
    }()


    init(withPath path: Path)
    {
        self.path = path
    }
}

    // public static func getToolchains(including) -> [ToolChainItem]{
    //      let toolchainFiles = usr_bin.ls().filter{ fileName in
    //         fileName.basename().contains(supportedCompilersFilter)
    //     }
    //     var toolchains: [ToolChainItem] = []
    //     for (index,file) in toolchainFiles.enumerated(){
    //         toolchains.append(ToolChainItem(id:index, path: file))
    //     }
    //     return toolchains

    // }
