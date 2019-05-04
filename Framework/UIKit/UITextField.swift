import Foundation
import UIKit

// MARK: - UITextField extension

/// This extesion adds some useful functions to UITextField.
public extension UITextField {
    // MARK: - Functions
    
    /// Create an UITextField and set some parameters.
    ///
    /// - Parameters:
    ///   - frame: TextField frame.
    ///   - placeholder: TextField text placeholder.
    ///   - font: TextField text font.
    ///   - textColor: TextField text color.
    ///   - returnKeyType:  TextField return key type.
    ///   - keyboardType: TextField keyboard type.
    ///   - secure: Set if the TextField is secure or not.
    ///   - borderStyle: TextField border style.
    ///   - autocapitalizationType: TextField text capitalization.
    ///   - keyboardAppearance: TextField keyboard appearence.
    ///   - enablesReturnKeyAutomatically: Set if the TextField has to automatically enables the return key.
    ///   - clearButtonMode: TextField clear button mode.
    ///   - autoCorrectionType: TextField auto correction type.
    ///   - delegate: TextField delegate. Set nil if it has no delegate.
    convenience init(frame: CGRect, placeholder: String, font: UIFont, textColor: UIColor, returnKeyType: UIReturnKeyType, keyboardType: UIKeyboardType, secure: Bool, borderStyle: UITextField.BorderStyle, autocapitalizationType: UITextAutocapitalizationType, keyboardAppearance: UIKeyboardAppearance, enablesReturnKeyAutomatically: Bool, clearButtonMode: UITextField.ViewMode, autocorrectionType: UITextAutocorrectionType, delegate: UITextFieldDelegate?) {
        self.init(frame: frame)
        self.borderStyle = borderStyle
        self.autocorrectionType = autocorrectionType
        self.clearButtonMode = clearButtonMode
        self.keyboardType = keyboardType
        self.autocapitalizationType = autocapitalizationType
        self.placeholder = placeholder
        self.textColor = textColor
        self.returnKeyType = returnKeyType
        self.enablesReturnKeyAutomatically = enablesReturnKeyAutomatically
        isSecureTextEntry = secure
        self.keyboardAppearance = keyboardAppearance
        self.font = font
        self.delegate = delegate
    }
    
    /// Create an UITextField and set some parameters.
    ///
    /// - Parameters:
    ///   - frame: TextField frame.
    ///   - placeholder: TextField text placeholder.
    ///   - font: TextField text font name.
    ///   - fontSize: TextField text size.
    ///   - textColor: TextField text color.
    ///   - returnKeyType:  TextField return key type.
    ///   - keyboardType: TextField keyboard type.
    ///   - secure: Set if the TextField is secure or not.
    ///   - borderStyle: TextField border style.
    ///   - autocapitalizationType: TextField text capitalization.
    ///   - keyboardAppearance: TextField keyboard appearence.
    ///   - enablesReturnKeyAutomatically: Set if the TextField has to automatically enables the return key.
    ///   - clearButtonMode: TextField clear button mode.
    ///   - autoCorrectionType: TextField auto correction type.
    ///   - delegate: TextField delegate. Set nil if it has no delegate.
    convenience init(frame: CGRect, placeholder: String, font: FontName, fontSize: CGFloat, textColor: UIColor, returnKeyType: UIReturnKeyType, keyboardType: UIKeyboardType, secure: Bool, borderStyle: UITextField.BorderStyle, autocapitalizationType: UITextAutocapitalizationType, keyboardAppearance: UIKeyboardAppearance, enablesReturnKeyAutomatically: Bool, clearButtonMode: UITextField.ViewMode, autocorrectionType: UITextAutocorrectionType, delegate: UITextFieldDelegate?) {
        self.init(frame: frame)
        self.borderStyle = borderStyle
        self.autocorrectionType = autocorrectionType
        self.clearButtonMode = clearButtonMode
        self.keyboardType = keyboardType
        self.autocapitalizationType = autocapitalizationType
        self.placeholder = placeholder
        self.textColor = textColor
        self.returnKeyType = returnKeyType
        self.enablesReturnKeyAutomatically = enablesReturnKeyAutomatically
        isSecureTextEntry = secure
        self.keyboardAppearance = keyboardAppearance
        self.font = UIFont(fontName: font, size: fontSize)
        self.delegate = delegate
    }
    
    /// Paste the pasteboard text to UITextField.
    func pasteFromPasteboard() {
        text = UIPasteboard.getString()
    }
    
    /// Copy UITextField text to pasteboard.
    func copyToPasteboard() {
        guard let text = text else {
            return
        }
        
        UIPasteboard.copy(text: text)
    }
}
