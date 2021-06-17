//
//  HexColours.swift
//  CowrywiseProject
//
//  Created by Decagon on 08/05/2021.
//

import UIKit

public class HexColourDelegate {
    // Blue
    var blue: UIColor {
        hexStringToUIColor("#0066f5")
    }
    //light blue
    var lightBlue: UIColor {
        hexStringToUIColor("#82a9f1")
    }
    // White
    var white: UIColor {
        hexStringToUIColor("#f7f9ff")
    }
    //Grey
    var grey: UIColor {
        hexStringToUIColor("#d4d3d4")
    }
    //Black
    var black: UIColor {
        hexStringToUIColor("#151515")
    }
    
  
    func hexStringToUIColor (_ hex:String) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }
        if ((cString.count) != 6) {
            return UIColor.gray
        }

        var rgbValue:UInt64 = 0
        Scanner(string: cString).scanHexInt64(&rgbValue)

        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
}
