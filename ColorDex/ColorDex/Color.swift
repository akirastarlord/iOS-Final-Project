//
//  Color.swift
//  WebParser
//
//  Created by yy的mac on 2019/11/23.
//  Copyright © 2019 yy的mac. All rights reserved.
//

import Foundation

class Color {
    let name: String
    var colorCode: String
    let hiragana: String?
    let romanji: String?

    
    var link: String? // default - nil
    
    var story: String? // default - nil
    
    init(name: String, colorCode: String, hiragana: String? = nil, romanji: String? = nil) {
        self.name = name
        self.colorCode = colorCode
        self.hiragana = hiragana
        self.romanji = romanji
        
    }
    
}
