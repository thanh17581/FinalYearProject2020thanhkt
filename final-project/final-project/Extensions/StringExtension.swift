//
//  StringExtension.swift
//  final-project
//
//  Created by Vinsofts on 11/16/20.
//  Copyright © 2020 Vinsofts. All rights reserved.
//

import Foundation
import UIKit

extension String {
    
    var trimed: String {
        return trimmingCharacters(in: .whitespacesAndNewlines)
    }
    
    func widthOfString(usingFont font: UIFont) -> CGFloat {
        let fontAttributes = [NSAttributedString.Key.font: font]
        let size = self.size(withAttributes: fontAttributes)
        return size.width
    }
    
    func heightOfString(usingFont font: UIFont) -> CGFloat {
        let fontAttributes = [NSAttributedString.Key.font: font]
        let size = self.size(withAttributes: fontAttributes)
        return size.height
    }
    
    func sizeOfString(usingFont font: UIFont) -> CGSize {
        let fontAttributes = [NSAttributedString.Key.font: font]
        return self.size(withAttributes: fontAttributes)
    }
    
    func containsIgnoringCase(find: String) -> Bool{
        return self.range(of: find, options: .caseInsensitive) != nil
    }
    
    func hasSpcialCharacter() -> Bool {
        for s in ["*", "!", "#", "$", "%", "^", "&", "<", ">", "'", "\"", "~", "`", "|", "?"] {
            if self.contains(s) {
                return true
            }
        }
        return false
    }
}
