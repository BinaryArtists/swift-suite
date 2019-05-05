import Foundation

// MARK: - Collection extension
/// This extension adds some useful functions to Collection protocol.
public extension Collection {
    // MARK: - Functions
    
    /// Convert self to JSON as String.
    ///
    /// - Returns: Returns the JSON as String or nil if error while parsing.
    /// - Throws: Throws JSONSerialization and BFKitError.jsonSerialization errors.
    func json() throws -> String {
        let jsonData: Data = try JSONSerialization.data(withJSONObject: self, options: [])
        
        guard let json = NSString(data: jsonData, encoding: String.Encoding.utf8.rawValue) else {
            throw _Error.jsonSerialization
        }
        return String(describing: json)
    }
}
