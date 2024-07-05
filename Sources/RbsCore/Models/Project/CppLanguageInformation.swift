import Foundation

struct CppLanguageInformation : Codable {
    var standard: String = "c++23"
    var warnings: Warnings
}
