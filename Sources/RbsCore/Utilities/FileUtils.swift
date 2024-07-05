import Foundation

extension FileManager{
    func writeFile(withContents contents: String, to destination: String)
    {
        //Writes data in "myfile.txt"
        if let data = contents.data(using: .utf8) {
            createFile(atPath: destination, contents: data, attributes: nil)
        } else {
            //TODO: Error handling
        }
    }
}
