import Foundation
import UIKit

// MARK: - UIToolbar extension

/// This extesion adds some useful functions to UIToolbar.
public extension UIToolbar {
    // MARK: - Functions
    
    /// Set the UIToolbar transparent or not.
    ///
    /// - Parameters:
    ///   - transparent: Set to true if trasparent, otherwise false.
    ///   - translucent: Set to true if translucent, otherwise false.
    func setTransparent(_ transparent: Bool, translucent: Bool = true) {
        if transparent {
            setBackgroundImage(UIImage(), forToolbarPosition: .any, barMetrics: .default)
            setShadowImage(UIImage(), forToolbarPosition: .any)
        } else {
            setBackgroundImage(nil, forToolbarPosition: .any, barMetrics: .default)
            setShadowImage(nil, forToolbarPosition: .any)
        }
        
        isTranslucent = translucent
    }
}
