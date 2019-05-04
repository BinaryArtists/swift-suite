import Foundation
import UIKit

// MARK: - BFTextField - UITextField subclass

/// This class adds some useful functions to UITextField that cannot be in an extension.
open class BFTextField: UITextField {
    // MARK: - Variables
    
    /// Max number of characters allowed by TextField.
    @IBInspectable public var maxNumberOfCharacters: Int = 0
    
    // MARK: - Functions
    
    /// Required init function.
    ///
    /// - Parameter aDecoder: NSCoder.
    ///
    /// - Returns: The initialized instance.
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        maxNumberOfCharacters = aDecoder.decodeInteger(forKey: "MaxNumberOfCharacters")
        NotificationCenter.default.addObserver(self, selector: #selector(BFTextField.textFieldDidChange(_:)), name: UITextField.textDidChangeNotification, object: self)
    }
    
    /// Encodes added variables.
    ///
    /// - Parameter aCoder: NSCoder.
    override open func encode(with aCoder: NSCoder) {
        super.encode(with: aCoder)
        
        aCoder.encode(maxNumberOfCharacters, forKey: "MaxNumberOfCharacters")
    }
    
    /// Override init with frame.
    ///
    /// - Parameter frame: TextField frame.
    override public init(frame: CGRect) {
        super.init(frame: frame)
        
        maxNumberOfCharacters = 0
        NotificationCenter.default.addObserver(self, selector: #selector(BFTextField.textFieldDidChange(_:)), name: UITextField.textDidChangeNotification, object: self)
    }
    
    @objc
    /// Text field did change function.
    ///
    /// Called by observer.
    ///
    /// - Parameter notification: Notification object.
    private func textFieldDidChange(_ notification: Notification) {
        guard let text = text else {
            return
        }
        
        if maxNumberOfCharacters != 0, text.count >= maxNumberOfCharacters {
            self.text = text.substring(to: maxNumberOfCharacters)
        }
    }
    
    /// Deinit function.
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
}
