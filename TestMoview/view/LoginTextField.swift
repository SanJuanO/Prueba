
import UIKit

class LoginTextField: UITextField {
     var padding = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    
    
    override var placeholder: String? {
        get {
            return super.placeholder
        } set {
            super.placeholder = newValue
            
            let style = NSMutableParagraphStyle()
            style.alignment = NSTextAlignment.left

                let attributes: [NSAttributedString.Key: Any] = [.font: UIFont.global(font: .sansLight, ofSize: 16.0) as Any,
                                                                 .foregroundColor: UIColor.black,
                                                                 .paragraphStyle: style]
                let attributedString: NSAttributedString = NSAttributedString(string: newValue ?? "",
                                                                              attributes: attributes)
                attributedPlaceholder = attributedString
            backgroundColor = UIColor.white
            layer.cornerRadius = 4
        }
    }
 
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override open func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override open func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override open func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
}
