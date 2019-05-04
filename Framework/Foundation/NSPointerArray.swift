import Foundation

// MARK: - NSPointerArray extension

/// This extension adds some useful functions to NSPointerArray.
/// https://marcosantadev.com/swift-arrays-holding-elements-weak-references/
public extension NSPointerArray {
    /// Adds an object to the array.
    ///
    /// - Parameter object: Object to be added.
    func add(_ object: AnyObject?) {
        guard let strongObject = object else {
            return
        }
        
        let pointer = Unmanaged.passUnretained(strongObject).toOpaque()
        addPointer(pointer)
    }
    
    /// Inserts an object at a given index inside the array.
    ///
    /// - Parameters:
    ///   - object: Object to be inserted.
    ///   - index: Index.
    func insert(_ object: AnyObject?, at index: Int) {
        guard index < count, let strongObject = object else {
            return
        }
        
        let pointer = Unmanaged.passUnretained(strongObject).toOpaque()
        insertPointer(pointer, at: index)
    }
    
    /// Replaces an object at a given index inside the array.
    ///
    /// - Parameters:
    ///   - index: Index.
    ///   - object: Replacing object.
    func replace(at index: Int, with object: AnyObject?) {
        guard index < count, let strongObject = object else {
            return
        }
        
        let pointer = Unmanaged.passUnretained(strongObject).toOpaque()
        replacePointer(at: index, withPointer: pointer)
    }
    
    /// Returns an object at index.
    ///
    /// - Parameter index: Index.
    /// - Returns: Returns an object at index.
    func object(at index: Int) -> AnyObject? {
        guard index < count, let pointer = pointer(at: index) else {
            return nil
        }
        
        return Unmanaged<AnyObject>.fromOpaque(pointer).takeUnretainedValue()
    }
    
    /// Remove an object at a given index.
    ///
    /// - Parameter index: Index.
    func remove(at index: Int) {
        guard index < count else {
            return
        }
        
        removePointer(at: index)
    }
}
