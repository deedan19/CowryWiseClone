//
//  HorizontalLine.swift
//  CowrywiseProject
//
//  Created by Decagon on 10/05/2021.
//

import UIKit

class HorizontalLine: UIView {
    private let color = HexColourDelegate()
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = color.grey
        constrainHeight(constant: 1)
    
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
