import Foundation
import UIKit
import ImageIO

extension UIView{
    
    @IBInspectable var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }

    @IBInspectable var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }

    @IBInspectable var borderColor: UIColor? {
        get {
            return UIColor(cgColor: layer.borderColor!)
        }
        set {
            layer.borderColor = newValue?.cgColor
        }
    }
    
    //func loaderShow(
}

//@IBDesignable
//class DesignableView: UIView {
//}
//
//@IBDesignable
//class DesignableButton: UIButton {
//}
//
//@IBDesignable
//class DesignableLabel: UILabel {
//}

@IBDesignable
extension UIView {
    
    
//    @IBInspectable
//    
//    var cornerRadius: CGFloat {
//        get {
//            return layer.cornerRadius
//        }
//        set {
//            layer.cornerRadius = newValue
//        }
//    }
//    
//    @IBInspectable
//    var borderWidth: CGFloat {
//        get {
//            return layer.borderWidth
//        }
//        set {
//            layer.borderWidth = newValue
//        }
//    }
//    
//    @IBInspectable
//    var borderColor: UIColor? {
//        get {
//            if let color = layer.borderColor {
//                return UIColor(cgColor: color)
//            }
//            return nil
//        }
//        set {
//            if let color = newValue {
//                layer.borderColor = color.cgColor
//            } else {
//                layer.borderColor = nil
//            }
//        }
//    }
    
    @IBInspectable
    var shadowRadius: CGFloat {
        get {
            return layer.shadowRadius
        }
        set {
            layer.shadowRadius = newValue
        }
    }
    
    @IBInspectable
    var shadowOpacity: Float {
        get {
            return layer.shadowOpacity
        }
        set {
            layer.shadowOpacity = newValue
        }
    }
    
    @IBInspectable
    var shadowOffset: CGSize {
        get {
            return layer.shadowOffset
        }
        set {
            layer.shadowOffset = newValue
        }
    }
    
    @IBInspectable
    var shadowColor: UIColor? {
        get {
            if let color = layer.shadowColor {
                return UIColor(cgColor: color)
            }
            return nil
        }
        set {
            if let color = newValue {
                layer.shadowColor = color.cgColor
            } else {
                layer.shadowColor = nil
            }
        }
    }
}

extension UISlider {
    var thumbCenterX: CGFloat {
        let trackRect = self.trackRect(forBounds: frame)
        let thumbRect = self.thumbRect(forBounds: bounds, trackRect: trackRect, value: value)
        return thumbRect.midX
    }
}

fileprivate func < <T : Comparable>(lhs: T?, rhs: T?) -> Bool {
    switch (lhs, rhs) {
    case let (l?, r?):
        return l < r
    case (nil, _?):
        return true
    default:
        return false
    }
}


class DesignableTextField: UITextField{}

extension UITextField {
    
    @IBInspectable override var cornerRadius: CGFloat {
        set { layer.cornerRadius = newValue  }
        get { return layer.cornerRadius }
    }
    
    @IBInspectable var placeHolderColor: UIColor? {
        get {
            return self.placeHolderColor
        }
        set {
            self.attributedPlaceholder = NSAttributedString(string:self.placeholder != nil ? self.placeholder! : "", attributes:[NSAttributedStringKey.foregroundColor: newValue!])
            if let iconView = rightView?.subviews.first as? UIImageView {
                iconView.tintColor = newValue
                //iconView.ti
            }
        }
    }
    
    @IBInspectable var padding: CGFloat {
        get {
            guard let iconView = rightView?.subviews.first as? UIImageView else { return rightView!.frame.size.width }
            //return rightView!.frame.size.width - (iconView.frame.origin.x + iconView.frame.size.width)
            return leftView!.frame.size.width
        }
        set {
            leftViewMode = .always
            rightViewMode = .always
            if let iconView = rightView?.subviews.first as? UIImageView {
                rightView?.frame.size = CGSize(width: iconView.frame.origin.x + iconView.frame.size.width + newValue - 10, height: (leftView?.frame.size.height)!)
            } else {
                let view = UIView(frame: CGRect(x: 0, y: 0, width: newValue, height: (font?.pointSize)!))
                rightView = view
            }
            
            leftView = UIView(frame: CGRect(x: 0, y: 0, width: newValue, height: (font?.pointSize)!))
        }
    }
    
    @IBInspectable var rightImage: UIImage? {
        get {
            guard let iconView = rightView?.subviews.first as? UIImageView else { return nil }
            return iconView.image
        }
        set {
            rightViewMode = .always
            //            if let iconView = rightView?.subviews.first as? UIImageView {
            //                iconView.image = newValue
            //                //iconView.image = iconView.image?.withRenderingMode(.alwaysTemplate)
            //                iconView.frame.size = CGSize(width: , height: <#T##CGFloat#>)
            //            } else {
            let scaleFactor = (font?.pointSize)!/(newValue?.size.height)!
            let view = UIView(frame: CGRect(x: 0, y: 0, width: padding + (newValue?.size.width)! * scaleFactor, height: (font?.pointSize)!))
            let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: (newValue?.size.width)! * scaleFactor, height: (font?.pointSize)!))
            imageView.image = newValue
            //imageView.tintColor = placeHolderColor
            view.addSubview(imageView)
            rightView = view
            //}
        }
    }
    
}

extension UIColor {
    convenience init(hexString: String, alpha: CGFloat = 1.0) {
        let hexString: String = hexString.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        let scanner = Scanner(string: hexString)
        if (hexString.hasPrefix("#")) {
            scanner.scanLocation = 1
        }
        var color: UInt32 = 0
        scanner.scanHexInt32(&color)
        let mask = 0x000000FF
        let r = Int(color >> 16) & mask
        let g = Int(color >> 8) & mask
        let b = Int(color) & mask
        let red   = CGFloat(r) / 255.0
        let green = CGFloat(g) / 255.0
        let blue  = CGFloat(b) / 255.0
        self.init(red:red, green:green, blue:blue, alpha:alpha)
    }
    func toHexString() -> String {
        var r:CGFloat = 0
        var g:CGFloat = 0
        var b:CGFloat = 0
        var a:CGFloat = 0
        getRed(&r, green: &g, blue: &b, alpha: &a)
        let rgb:Int = (Int)(r*255)<<16 | (Int)(g*255)<<8 | (Int)(b*255)<<0
        return String(format:"#%06x", rgb)
    }
}

extension UITableView {
    
    
}
extension UIButton {
    func loadingIndicator(_ show: Bool) {
        let tag = 808404
        if show {
            self.isEnabled = false
            self.alpha = 0.7
            let indicator = UIActivityIndicatorView()
            let buttonHeight = self.bounds.size.height
            //let buttonWidth = self.bounds.size.width
            indicator.center = CGPoint(x: (self.titleLabel?.frame.origin.x)! - 15, y: buttonHeight/2)
            indicator.tag = tag
            self.addSubview(indicator)
            indicator.startAnimating()

        } else {
            self.isEnabled = true
            self.alpha = 1.0
            if let indicator = self.viewWithTag(tag) as? UIActivityIndicatorView {
                indicator.stopAnimating()
                indicator.removeFromSuperview()
            }
        }
    }
}

class ExtendTouchAreaButton: UIButton {
    
    @IBInspectable var touchAreaTop: CGFloat = 0.0
    @IBInspectable var touchAreaBottom: CGFloat = 0.0
    @IBInspectable var touchAreaRight: CGFloat = 0.0
    @IBInspectable var touchAreaLeft: CGFloat = 0.0
    
    override open func point(inside point: CGPoint, with event:
        
        UIEvent?) -> Bool {
        
        let relativeFrame = self.bounds
        let hitTestEdgeInsets = UIEdgeInsetsMake(touchAreaTop, touchAreaLeft, touchAreaBottom, touchAreaRight)
        let hitFrame = UIEdgeInsetsInsetRect(relativeFrame, hitTestEdgeInsets)
        return hitFrame.contains(point)
    }
}
