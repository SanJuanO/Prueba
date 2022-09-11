
import UIKit

extension UIFont {
    
    enum Global: String {
        case broad = "Broad"
        case sansLight_Bold = "SansLight_Bold"
        case sansLight = "SansLight"
        case serif = "Serif"
     
    }
    
  
    @nonobjc class func global(font: Global, ofSize: CGFloat) -> UIFont {
        return UIFont(name: "\(font.rawValue)", size: ofSize) ?? UIFont.systemFont(ofSize: ofSize)
    }
    

}
