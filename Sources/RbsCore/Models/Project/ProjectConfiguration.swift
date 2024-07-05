import Foundation

struct ProjectConfiguration: Codable {
    var startup: Int = 0
    var projects: [Project]
}

extension ProjectConfiguration{
    init?(from file: String = "rbsconfig.json")
    {
        let fileManager = FileManager.default
        guard let JSONData = fileManager.contents(atPath: file) else{
            return nil
        }
        let jsonDecoder = JSONDecoder()
        guard let result = try? jsonDecoder.decode(ProjectConfiguration.self, from: JSONData) else{
            return nil
        }
        self = result
    }

    func projectWith(id _id: Int?) -> Project?{
        guard let id = _id  else{
            return nil}

        for project in self.projects{
            if(project.id == id){
                return project;

            }
        }
        return nil
    }
    func projectWith(name _name: String?) -> Project?{
        guard let name = _name else {
            return nil}

        for project in self.projects{
            if(project.name == name){
                return project;
            }
        }
        return nil
    }

}
