import UIKit

// MARK: - BFButton - UIButton subclass

/// This class adds some useful functions to UIButton that cannot be in an extension.
open class BFButton: UIButton {
    // MARK: - Variables
    
    /// The fade duration.
    public var fadeDuration: TimeInterval = 0
    
    /// The animation on highlighted status.
    override open var isHighlighted: Bool {
        didSet(highlighted) {
            if highlighted == false {
                addSubview(overlayImageView)
                overlayImageView.alpha = 0
                
                UIView.animate(withDuration: fadeDuration) { [weak self] in
                    self?.overlayImageView.alpha = 1
                }
            } else {
                UIView.animate(
                    withDuration: fadeDuration, animations: { [weak self] in
                        self?.overlayImageView.alpha = 0
                    }, completion: { [weak self] completed in
                        if completed {
                            self?.overlayImageView.removeFromSuperview()
                        }
                    }
                )
            }
        }
    }
    
    /// The overlay image, cannot be nil.
    public var overlayImageView: UIImageView! { // swiftlint:disable:this implicitly_unwrapped_optional
        didSet(newOverlayImageView) {
            if overlayImageView != newOverlayImageView, newOverlayImageView != nil {
                overlayImageView = newOverlayImageView
            }
            
            overlayImageView.frame = imageView?.frame ?? CGRect.zero
            overlayImageView.bounds = imageView?.bounds ?? CGRect.zero
            overlayImageView.alpha = 0
        }
    }
    
    // MARK: - Functions
    
    /// Required init function.
    ///
    /// - Parameter aDecoder: NSCoder.
    /// - Returns: The initialized instance.
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        fadeDuration = aDecoder.decodeDouble(forKey: "FadeDuration")
        guard let decodedOverlayImageView = aDecoder.decodeObject(forKey: "OverlayImageView") as? UIImageView else {
            return nil
        }
        
        overlayImageView = decodedOverlayImageView
        overlayImageView.frame = imageView?.frame ?? CGRect.zero
        overlayImageView.bounds = imageView?.bounds ?? CGRect.zero
        
        adjustsImageWhenHighlighted = false
    }
    
    /// Encodes added variables.
    ///
    /// - Parameter aCoder: NSCoder.
    override open func encode(with aCoder: NSCoder) {
        super.encode(with: aCoder)
        
        aCoder.encode(fadeDuration, forKey: "FadeDuration")
        aCoder.encode(overlayImageView, forKey: "OverlayImageView")
    }
    
    /// Create an UIButton with a fade animation from image to highlightedImage on touch.
    ///
    /// - Parameters:
    ///   - frame: Button frame.
    ///   - image: Button image.
    ///   - highlightedImage: Button highlighted image.
    ///   - fadeDuration: Fade duration.
    public init(frame: CGRect, image: UIImage, highlightedImage: UIImage, fadeDuration: TimeInterval) {
        self.fadeDuration = fadeDuration
        
        super.init(frame: frame)
        
        setImage(image, for: UIControl.State())
        overlayImageView = UIImageView(image: highlightedImage)
        overlayImageView.frame = imageView?.frame ?? CGRect.zero
        overlayImageView.bounds = imageView?.bounds ?? CGRect.zero
        
        adjustsImageWhenHighlighted = false
    }
}
