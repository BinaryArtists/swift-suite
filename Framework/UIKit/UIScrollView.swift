import Foundation
import UIKit

// MARK: - UIScrollView extension

/// This extesion adds some useful functions to UIScrollView.
public extension UIScrollView {
    // MARK: - Functions
    
    /// Create an UIScrollView and set some parameters.
    ///
    /// - Parameters:
    ///   - frame: ScrollView frame.
    ///   - contentSize: ScrollView content size.
    ///   - clipsToBounds: Set if ScrollView has to clips to bounds.
    ///   - pagingEnabled: Set if ScrollView has paging enabled.
    ///   - showScrollIndicators: Set if ScrollView has to show the scroll indicators, vertical and horizontal.
    ///   - delegate: ScrollView delegate.
    convenience init(frame: CGRect, contentSize: CGSize, clipsToBounds: Bool, pagingEnabled: Bool, showScrollIndicators: Bool, delegate: UIScrollViewDelegate?) {
        self.init(frame: frame)
        self.delegate = delegate
        isPagingEnabled = pagingEnabled
        self.clipsToBounds = clipsToBounds
        showsVerticalScrollIndicator = showScrollIndicators
        showsHorizontalScrollIndicator = showScrollIndicators
        self.contentSize = contentSize
    }
}
