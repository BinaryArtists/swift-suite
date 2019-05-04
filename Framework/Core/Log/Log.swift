import Foundation

// MARK: - Global functions

/// The private LogClass created to manage the log strings.
public enum _Log {
    // MARK: - Variables
    
    /// Activate or not _Log.
    public static var active: Bool = false
    
    /// The log string.
    public static var logged: String = ""
    /// The detailed log string.
    public static var detailedLog: String = ""
    
    // MARK: - Functions
    
    /// Exenteds NSLog.
    ///
    /// - Parameters:
    ///   - message: Console message.
    ///   - filename: File. Default is #file.
    ///   - function: Function name. Default is #function.
    ///   - line: Line number. Default is #line.
    public static func log(_ message: String, filename: String = #file, function: StaticString = #function, line: Int = #line) {
        if active {
            logged += message + "\n"
            
            let filenameWithoutExtension = URL(string: String(describing: NSString(utf8String: filename)))?.deletingPathExtension().lastPathComponent ?? "Unknown file"
            let log = "\(filenameWithoutExtension):\(line) \(function): \(message)"
            let timestamp = Date().description(dateSeparator: "-", usFormat: true, nanosecond: true)
            print("\(timestamp) \(filenameWithoutExtension):\(line) \(function): \(message)")
            
            detailedLog += log + "\n"
        }
    }
    
    /// Exenteds NSLog with a warning sign.
    ///
    /// - Parameters:
    ///   - message: Console message.
    ///   - filename: File. Default is #file.
    ///   - function: Function name. Default is #function.
    ///   - line: Line number. Default is #line.
    public static func warning(_ message: String, filename: String = #file, function: StaticString = #function, line: Int = #line) {
        log("[WARNING] \(message)", filename: filename, function: function, line: line)
    }
    
    /// Exenteds NSLog with an error sign.
    ///
    /// - Parameters:
    ///   - message: Console message.
    ///   - filename: File. Default is #file.
    ///   - function: Function name. Default is #function.
    ///   - line: Line number. Default is #line.
    public static func error(_ message: String, filename: String = #file, function: StaticString = #function, line: Int = #line) {
        log("[ERROR] \(message)", filename: filename, function: function, line: line)
    }
    
    /// Exenteds NSLog with a debug sign.
    ///
    /// - Parameters:
    ///   - message: Console message.
    ///   - filename: File. Default is #file.
    ///   - function: Function name. Default is #function.
    ///   - line: Line number. Default is #line.
    public static func debug(_ message: String, filename: String = #file, function: StaticString = #function, line: Int = #line) {
        log("[DEBUG] \(message)", filename: filename, function: function, line: line)
    }
    
    /// Exenteds NSLog with an info sign.
    ///
    /// - Parameters:
    ///   - message: Console message.
    ///   - filename: File. Default is #file.
    ///   - function: Function name. Default is #function.
    ///   - line: Line number. Default is #line.
    public static func info(_ message: String, filename: String = #file, function: StaticString = #function, line: Int = #line) {
        log("[INFO] \(message)", filename: filename, function: function, line: line)
    }
    
    /// Clear the log string.
    public static func clear() {
        logged = ""
        detailedLog = ""
    }
    
    /// Save the Log in a file.
    ///
    /// - Parameters:
    ///   - path: Save path.
    ///   - filename: Log filename.
    /// - Throws: write(toFile:, atomically:, encoding:) errors.
    public static func saveLog(in path: FileManager.PathType, filename: String) throws {
        try FileManager.default.save(file: filename, in: path, content: detailedLog)
    }
}
