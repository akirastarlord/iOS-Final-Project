//
//  Utilities.swift
//  WebParser
//
//  Created by yy的mac on 2019/11/23.
//  Copyright © 2019 yy的mac. All rights reserved.
//

import Foundation
import UIKit

/*
extension String {
    var htmlDecoded: String {
        let decoded = try? NSAttributedString(data: Data(utf8), options: [
            .documentType: NSAttributedString.DocumentType.html,
            .characterEncoding: String.Encoding.utf8.rawValue
        ], documentAttributes: nil).string

        return decoded ?? self
    }
}
 */

extension String {
    func endingNewLinesRemoved() -> String {
        var ret = self
        var ending = ret.index(before: ret.endIndex)
        while ret[ending] == "\n" {
            ret = String(ret[..<ending])
            ending = ret.index(before: ret.endIndex)
        }
        return ret
    }
}

/* If not a hex color that starts with #
   return nil */
extension UIColor {
    public convenience init?(hex: String) {
        let r, g, b, a: CGFloat
        let hexColorIndicator = hex.firstIndex(of: "#")
        /* check if it is in the right format */
        if let hexColorIndicator = hexColorIndicator, hexColorIndicator == hex.startIndex {
            let colorValueRange = (hex.index(after: hexColorIndicator))...
            let hexColor = String(hex[colorValueRange])
            let scanner = Scanner(string: hexColor)
            var temp: UInt64 = 0
            // scan hexcolor as a representation of UInt64 into the address of temp
            if scanner.scanHexInt64(&temp) {
                /* a hex color that does not define alpha
                / default to 1.0 (fully opaque) */
                if hexColor.count == 6 {
                    r = CGFloat((temp & 0xff0000) >> 16) / 255
                    g = CGFloat((temp & 0x00ff00) >> 8) / 255
                    b = CGFloat(temp & 0x0000ff) / 255
                    self.init(red: r, green: g, blue: b, alpha: 1)
                    return
                }
                /* a hex color that defines alpha */
                else if hexColor.count == 8 {
                    r = CGFloat((temp & 0xff000000) >> 24) / 255
                    g = CGFloat((temp & 0x00ff0000) >> 16) / 255
                    b = CGFloat((temp & 0x0000ff00) >> 8) / 255
                    a = CGFloat(temp & 0x000000ff) / 255
                    self.init(red: r, green: g, blue: b, alpha: a)
                    return
                }
            }
        }
        return nil
    }
}
