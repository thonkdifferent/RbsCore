import Foundation
struct Depends : Codable{
    var aditionalIncludeDirs: [String] = []
    var extensions: [String]
    var libraries: [String]
    var repos: [String] = []
    var sourceFiles: [String]
    var languageInformation: CppLanguageInformation
}
