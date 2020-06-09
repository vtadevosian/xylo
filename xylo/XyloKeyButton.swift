//
//  XyloKeyButton.swift
//  xylo
//
//  Created by Vahram Tadevosian on 6/9/20.
//  Copyright © 2020 Vahram Tadevosian. All rights reserved.
//

import UIKit

class XyloKeyButton: UIButton {
    var highlightedBGColor = UIColor.white
    var unhighlightedBGColor = UIColor.white

    override var isHighlighted: Bool {
        didSet {
            self.setButtonBGColor(to: isHighlighted ? highlightedBGColor : unhighlightedBGColor)
        }
    }
    
    func setButtonBGColor(to color: UIColor) {
        self.backgroundColor = color
    }
}
