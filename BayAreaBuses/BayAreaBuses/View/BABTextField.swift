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
    
    
    // Creates padding for text in Text Field
    let padding = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 5)
    override open func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    override open func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    override open func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // Configures text field properties
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
