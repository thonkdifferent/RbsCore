import Foundation
class CommandLine{
    enum ProcessError : Error{
        case Failed(withCode: Int32)
    }
    
    public static func run(command: String) throws -> (stdout:String, stderr: String, code: Int32) {
        let task = Process()
        let stdout = Pipe()
        let stderr = Pipe()
        task.standardOutput = stdout
        task.standardError = stderr
        task.arguments = ["-c", command]
        task.executableURL = URL(fileURLWithPath: "/bin/zsh")
        task.standardInput = nil

        try task.run()
        task.waitUntilExit()

        let stderr_data =  stderr.fileHandleForReading.readDataToEndOfFile()
        let stdout_data = stdout.fileHandleForReading.readDataToEndOfFile()
        let output = String(data: stdout_data, encoding: .utf8) ?? ""
        let error = String(data: stderr_data, encoding: .utf8) ?? ""
        return (output,error,task.terminationStatus)
    }
}
