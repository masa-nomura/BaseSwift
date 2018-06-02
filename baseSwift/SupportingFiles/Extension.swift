//
//  extension.swift
//  iWakkaViewer1.0
//
//  Created by MasakazuNomura on 2017/10/17.
//  Copyright © 2017 MasakazuNomura. All rights reserved.
//

// gitを初回に選択し忘れた時．
// Xcodeを終了
// ターミナル起動
// cd <プロジェクト名>
// find .
// "UserInterfaceState.xcuserstate"を見つけ，ファイル名を全てコピー
// echo "paste the UserInterfaceState.xcuserstate file here" >.gitignore
// cat .gitignore
// git init
// git add .
// git commit -m "You can type a comment here like now under source control"


import Foundation
import UIKit

extension UIView {
    
    @IBInspectable
    var borderColor: UIColor? {
        get {
            return UIColor(cgColor: self.layer.borderColor!)
        }
        set {
            self.layer.borderColor = newValue?.cgColor
        }
    }
    
    @IBInspectable
    var borderWidth: CGFloat {
        get {
            return self.layer.borderWidth
        }
        set {
            self.layer.borderWidth = newValue
        }
    }
    
    @IBInspectable
    var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }
    
    @IBInspectable
    var isShadow: Bool {
        get {
            return true
        } set {
            if isShadow == true {
                self.layer.masksToBounds = false
                self.layer.shadowColor = UIColor.black.cgColor
                self.layer.shadowOpacity = 0.5
                self.layer.shadowOffset = CGSize(width: 5, height: 5)
                self.layer.shadowRadius = 5
            } else {
                
            }
        }
    }
}

extension UIColor {
    
    var toHexString: String {
        var r: CGFloat = 0
        var g: CGFloat = 0
        var b: CGFloat = 0
        var a: CGFloat = 0
        
        self.getRed(&r, green: &g, blue: &b, alpha: &a)
        
        return String(
            format: "%02X%02X%02X",
            Int(r * 0xff),
            Int(g * 0xff),
            Int(b * 0xff)
        )
    }

    convenience init(hex: String) {
        let scanner = Scanner(string: hex)
        scanner.scanLocation = 0
        
        var rgbValue: UInt64 = 0
        
        scanner.scanHexInt64(&rgbValue)
        
        let r = (rgbValue & 0xff0000) >> 16
        let g = (rgbValue & 0xff00) >> 8
        let b = rgbValue & 0xff
        
        self.init(
            red: CGFloat(r) / 0xff,
            green: CGFloat(g) / 0xff,
            blue: CGFloat(b) / 0xff, alpha: 1
        )
    }
}

extension DateFormatter {
    
    static var forAllDate: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "MM月dd日(E)HH:mm"
        formatter.timeZone = Calendar.current.timeZone
        formatter.locale = Locale(identifier: "ja_JP")
        return formatter
    }
}
