import Foundation


struct Project: Codable {
    var id: Int
    var name, executableName: String
    var authors: [String]
    var depends: Depends
    var version: String


}
extension Project{
    init? (name: String?){
        guard let projectConfiguration = ProjectConfiguration() else{
            return nil
        }

        guard let _name = name else { return nil}

        if _name.starts(with: "id:"){
            return nil;
        }

        self = projectConfiguration.projectWith(name: _name)!


    }
}
