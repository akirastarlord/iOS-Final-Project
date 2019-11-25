//
//  DetailViewController.swift
//  WebParser
//
//  Created by yy的mac on 2019/11/24.
//  Copyright © 2019 yy的mac. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, StoryReaderDelegate {
    
    var color: Color? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        if let color = color {
            
            if let link = color.link {
                let reader = Parser(url: link)
                reader.detailPageParserDelegate = self
                reader.readDetailPage(color)
            }
            
            if let colorView = view.viewWithTag(1) as? UIImageView {
                colorView.backgroundColor = UIColor(hex: color.colorCode)
            }
            if let nameLabel = view.viewWithTag(2) as? UILabel {
                nameLabel.text = color.name
            }
            if let kanaLabel = view.viewWithTag(3) as? UILabel {
                kanaLabel.text = color.hiragana
            }
            if let romanjiLabel = view.viewWithTag(4) as? UILabel {
                romanjiLabel.text = color.romanji
            }
            
        }
    }
    
    // MARK: - StoryReaderDelegate method
    func didFinishReadingStories() {
        DispatchQueue.main.async {
            if let textView = self.view.viewWithTag(5) as? UITextView {
                textView.text = self.color?.story
            }
        }
    }
    
    
    
}
