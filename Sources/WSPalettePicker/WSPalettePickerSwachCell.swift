//
//  WSPalettePickerSwachCell.swift
//  Mine
//
//  Created by Will Smillie on 12/5/20.
//  Copyright © 2020 Red Door Endeavors. All rights reserved.
//

import UIKit

@available(iOS 13.0, *)
class WSPalettePickerSwachCell: UICollectionViewCell {
    
    let circleLayer = CAShapeLayer()
    var color = UIColor.systemBlue {
        didSet{
            self.backgroundColor = color
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let buttonWidth = self.frame.size.width
        let circlePath = UIBezierPath(arcCenter: CGPoint(x: buttonWidth / 2,y: buttonWidth / 2), radius: (buttonWidth/2)+2, startAngle: 0, endAngle: CGFloat.pi * 2, clockwise: true)

        circleLayer.path = circlePath.cgPath
        circleLayer.fillColor = UIColor.clear.cgColor
        circleLayer.strokeColor = UIColor.label.cgColor
        circleLayer.lineWidth = 1
        circleLayer.isHidden = true
        
        layer.addSublayer(circleLayer)
        layer.cornerRadius = self.frame.size.height/2
    }
    
    
    override open func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        if #available(iOS 13, *), self.traitCollection.hasDifferentColorAppearance(comparedTo: previousTraitCollection) {
            circleLayer.strokeColor = UIColor.label.cgColor
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var isSelected: Bool {
        didSet {
            circleLayer.isHidden = !isSelected
        }
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
        
}
