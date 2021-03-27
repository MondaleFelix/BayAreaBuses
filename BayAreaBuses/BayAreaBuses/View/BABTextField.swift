//
//  BABTextField.swift
//  BayAreaBuses
//
//  Created by Mondale on 3/27/21.
//

import UIKit

class BABTextField: UITextField {

    override init(frame: CGRect) {
        super.init(frame:frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure(){
        translatesAutoresizingMaskIntoConstraints = false
        
        textColor = .label
        tintColor = .label
        layer.cornerRadius = 10
        layer.borderWidth = 2
        layer.borderColor = UIColor.systemGray4.cgColor
        placeholder = "Enter an address"
        backgroundColor = .white
        returnKeyType = .go
    
    }

}
