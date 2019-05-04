import Foundation
import UIKit

// MARK: - UILabel extension

/// This extesion adds some useful functions to UILabel.
public extension UILabel {
    // MARK: - Functions
    
    /// Create an UILabel with the given parameters.
    ///
    /// - Parameters:
    ///   - frame: Label frame.
    ///   - text: Label text.
    ///   - font: Label font.
    ///   - color: Label text color.
    ///   - alignment: Label text alignment.
    ///   - lines: Label text lines.
    ///   - shadowColor: Label text shadow color.
    convenience init(frame: CGRect, text: String, font: UIFont, color: UIColor, alignment: NSTextAlignment, lines: Int, shadowColor: UIColor = UIColor.clear) {
        self.init(frame: frame)
        self.font = font
        self.text = text
        backgroundColor = UIColor.clear
        textColor = color
        textAlignment = alignment
        numberOfLines = lines
        self.shadowColor = shadowColor
    }
    
    /// Create an UILabel with the given parameters.
    ///
    /// - Parameters:
    ///   - frame: Label frame.
    ///   - text: Label text.
    ///   - font: Label font name.
    ///   - size: Label font size.
    ///   - color: Label text color.
    ///   - alignment: Label text alignment.
    ///   - lines: Label text lines.
    ///   - shadowColor: Label text shadow color.
    convenience init(frame: CGRect, text: String, font: FontName, fontSize: CGFloat, color: UIColor, alignment: NSTextAlignment, lines: Int, shadowColor: UIColor = UIColor.clear) {
        self.init(frame: frame)
        self.font = UIFont(fontName: font, size: fontSize)
        self.text = text
        backgroundColor = UIColor.clear
        textColor = color
        textAlignment = alignment
        numberOfLines = lines
        self.shadowColor = shadowColor
    }
    
    /// Calculates height based on text, width and font.
    ///
    /// - Returns: Returns calculated height.
    func calculateHeight() -> CGFloat {
        guard let text = text else {
            return 0
        }
        return UIFont.calculateHeight(width: frame.size.width, font: font, text: text)
    }
    
//    /// Sets a custom font from a character at an index to character at another index.
//    ///
//    /// - Parameters:
//    ///   - font: New font to be setted.
//    ///   - fromIndex: The start index.
//    ///   - toIndex: The end index.
//    func setFont(_ font: UIFont, fromIndex: Int, toIndex: Int) {
//        guard let text = text else {
//            return
//        }
//
//        attributedText = text.attributedString.font(font, range: NSRange(location: fromIndex, length: toIndex - fromIndex))
//    }
//
//    /// Sets a custom font from a character at an index to character at another index.
//    ///
//    /// - Parameters:
//    ///   - font: New font to be setted.
//    ///   - fontSize: New font size.
//    ///   - fromIndex: The start index.
//    ///   - toIndex: The end index.
//    func setFont(_ font: FontName, fontSize: CGFloat, fromIndex: Int, toIndex: Int) {
//        guard let text = text, let font: UIFont = UIFont(fontName: font, size: fontSize) else {
//            return
//        }
//
//        attributedText = text.attributedString.font(font!, range: NSRange(location: fromIndex, length: toIndex - fromIndex))
//    }
}
