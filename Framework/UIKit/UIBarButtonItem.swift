import Foundation
import UIKit

// MARK: - UIBarButtonItem extension

/// This extesion adds some useful functions to UIBarButtonItem.
public extension UIBarButtonItem {
    // MARK: - Functions
    
    /// Create an UIBarButtonItem with type setted to FlexibleSpace or FixedSpace.
    ///
    /// - Parameters:
    ///   - space: Must be FlexibleSpace or FixedSpace, otherwise a FlexibleSpace UIBarButtonItem will be created.
    ///   - width: To use only if space is setted to FixedSpace, and it will be the width of it.
    convenience init(barButtonSpaceType space: UIBarButtonItem.SystemItem, width: CGFloat = 0.0) {
        if space == .fixedSpace || space == .flexibleSpace {
            self.init(barButtonSystemItem: space, target: nil, action: nil)
            
            if space == .fixedSpace {
                self.width = width
            }
        } else {
            self.init(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        }
    }
}
