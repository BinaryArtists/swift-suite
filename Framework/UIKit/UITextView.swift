import Foundation
import UIKit

// MARK: - UITextView extension

/// This extesion adds some useful functions to UITextView.
public extension UITextView {
    // MARK: - Functions
    
    /// Create an UITextView and set some parameters.
    ///
    /// - Parameters:
    ///   - frame: TextView frame.
    ///   - text: TextView text.
    ///   - font: TextView text font.
    ///   - textColor: TextView text color.
    ///   - alignment: TextView text alignment.
    ///   - dataDetectorTypes: TextView data detector types.
    ///   - editable: Set if TextView is editable.
    ///   - selectable: Set if TextView is selectable.
    ///   - returnKeyType: TextView return key type.
    ///   - keyboardType: TextView keyboard type.
    ///   - secure: Set if the TextView is secure or not.
    ///   - autocapitalizationType: TextView text capitalization.
    ///   - keyboardAppearance: TextView keyboard appearence.
    ///   - enablesReturnKeyAutomatically: Set if the TextView has to automatically enables the return key.
    ///   - autocorrectionType: TextView auto correction type.
    ///   - delegate: TextView delegate. Set nil if it has no delegate.
    convenience init(frame: CGRect, text: String, font: UIFont, textColor: UIColor, alignment: NSTextAlignment, dataDetectorTypes: UIDataDetectorTypes, editable: Bool, selectable: Bool, returnKeyType: UIReturnKeyType, keyboardType: UIKeyboardType, secure: Bool, autocapitalizationType: UITextAutocapitalizationType, keyboardAppearance: UIKeyboardAppearance, enablesReturnKeyAutomatically: Bool, autocorrectionType: UITextAutocorrectionType, delegate: UITextViewDelegate?) {
        self.init(frame: frame)
        self.text = text
        self.autocorrectionType = autocorrectionType
        self.textAlignment = alignment
        self.keyboardType = keyboardType
        self.autocapitalizationType = autocapitalizationType
        self.textColor = textColor
        self.returnKeyType = returnKeyType
        self.enablesReturnKeyAutomatically = enablesReturnKeyAutomatically
        isSecureTextEntry = secure
        self.keyboardAppearance = keyboardAppearance
        self.font = font
        self.delegate = delegate
        self.dataDetectorTypes = dataDetectorTypes
        isEditable = editable
        isSelectable = selectable
    }
    
    /// Create an UITextView and set some parameters.
    ///
    /// - Parameters:
    ///   - frame: TextView frame.
    ///   - text: TextView text.
    ///   - font: TextView text font name.
    ///   - fontSize: TextView text size.
    ///   - textColor: TextView text color.
    ///   - alignment: TextView text alignment.
    ///   - dataDetectorTypes: TextView data detector types.
    ///   - editable: Set if TextView is editable.
    ///   - selectable: Set if TextView is selectable.
    ///   - returnKeyType: TextView return key type.
    ///   - keyboardType: TextView keyboard type.
    ///   - secure: Set if the TextView is secure or not.
    ///   - autocapitalizationType: TextView text capitalization.
    ///   - keyboardAppearance: TextView keyboard appearence.
    ///   - enablesReturnKeyAutomatically: Set if the TextView has to automatically enables the return key.
    ///   - autocorrectionType: TextView auto correction type.
    ///   - delegate: TextView delegate. Set nil if it has no delegate.
    convenience init(frame: CGRect, text: String, font: FontName, fontSize: CGFloat, textColor: UIColor, alignment: NSTextAlignment, dataDetectorTypes: UIDataDetectorTypes, editable: Bool, selectable: Bool, returnKeyType: UIReturnKeyType, keyboardType: UIKeyboardType, secure: Bool, autocapitalizationType: UITextAutocapitalizationType, keyboardAppearance: UIKeyboardAppearance, enablesReturnKeyAutomatically: Bool, autocorrectionType: UITextAutocorrectionType, delegate: UITextViewDelegate?) {
        self.init(frame: frame)
        self.text = text
        self.autocorrectionType = autocorrectionType
        textAlignment = alignment
        self.keyboardType = keyboardType
        self.autocapitalizationType = autocapitalizationType
        self.textColor = textColor
        self.returnKeyType = returnKeyType
        self.enablesReturnKeyAutomatically = enablesReturnKeyAutomatically
        isSecureTextEntry = secure
        self.keyboardAppearance = keyboardAppearance
        self.font = UIFont(fontName: font, size: fontSize)
        self.delegate = delegate
        self.dataDetectorTypes = dataDetectorTypes
        isEditable = editable
        isSelectable = selectable
    }
    
    /// Paste the pasteboard text to UITextView
    func pasteFromPasteboard() {
        text = UIPasteboard.getString()
    }
    
    /// Copy UITextView text to pasteboard
    func copyToPasteboard() {
        UIPasteboard.copy(text: text)
    }
}
