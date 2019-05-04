import Foundation
import UIKit

// MARK: - UIButton extension

/// This extesion adds some useful functions to UIButton.
public extension UIButton {
    // MARK: - Functions
    
    /// Create an UIButton in a frame with a title, a background image and highlighted background image.
    ///
    /// - Paramters:
    ///   - frame: Button frame.
    ///   - title: Button title.
    ///   - backgroundImage: Button background image.
    ///   - highlightedBackgroundImage: Button highlighted background image.
    convenience init(frame: CGRect, title: String, backgroundImage: UIImage? = nil, highlightedBackgroundImage: UIImage? = nil) {
        self.init(frame: frame)
        self.frame = frame
        setTitle(title, for: UIControl.State.normal)
        setBackgroundImage(backgroundImage, for: UIControl.State.normal)
        setBackgroundImage(highlightedBackgroundImage, for: UIControl.State.highlighted)
    }
    
    /// Create an UIButton in a frame with a title and a color.
    ///
    /// - Parameters:
    ///   - frame: Button frame.
    ///   - title: Button title.
    ///   - color: Button color, the highlighted color will be automatically created.
    convenience init(frame: CGRect, title: String, color: UIColor) {
        guard let components: UnsafePointer<CGFloat> = color.cgColor.__unsafeComponents else {
            self.init(frame: frame, title: title)
            return
        }
        
        self.init(frame: frame, title: title, backgroundImage: UIImage(color: color), highlightedBackgroundImage: UIImage(color: UIColor(red: components[0] - 0.1, green: components[1] - 0.1, blue: components[2] - 0.1, alpha: 1)))
    }
    
    /// Create an UIButton in a frame with a title, a color and highlighted color.
    ///
    /// - Parameters:
    ///   - frame: Button frame.
    ///   - title: Button title.
    ///   - color: Button color.
    ///   - highlightedColor: Button highlighted color.
    convenience init(frame: CGRect, title: String, color: UIColor, highlightedColor: UIColor) {
        self.init(frame: frame, title: title, backgroundImage: UIImage(color: color), highlightedBackgroundImage: UIImage(color: highlightedColor))
    }
    
    /// Create an UIButton in a frame with an image
    ///
    /// - Parameters:
    ///   - frame: Button frame
    ///   - image: Button image
    ///   - highlightedImage: Button highlighted image
    convenience init(frame: CGRect, image: UIImage, highlightedImage: UIImage? = nil) {
        self.init(frame: frame)
        self.frame = frame
        setImage(image, for: UIControl.State.normal)
        setImage(highlightedImage, for: UIControl.State.highlighted)
    }
    
    /// Set the title font with a size.
    ///
    /// - Parameters:
    ///   - fontName: Font name from the FontName enum declared in UIFontExtension.
    ///   - size:Font size.
    func setTitleFont(_ fontName: FontName, size: CGFloat) {
        if let titleLabel = titleLabel {
            titleLabel.font = UIFont(fontName: fontName, size: size)
        }
    }
    
    /// Set the title color.
    ///
    /// - Parameter color: Font color, the highlighted color will be automatically created.
    func setTitleColor(_ color: UIColor) {
        setTitleColor(color, highlightedColor: color.withAlphaComponent(0.4))
    }
    
    /// Set the title color and highlighted color
    ///
    /// - Parameters:
    ///   - color: Button color
    ///   - highlightedColor: Button highlighted color
    func setTitleColor(_ color: UIColor, highlightedColor: UIColor) {
        setTitleColor(color, for: UIControl.State.normal)
        setTitleColor(highlightedColor, for: UIControl.State.highlighted)
    }
}
