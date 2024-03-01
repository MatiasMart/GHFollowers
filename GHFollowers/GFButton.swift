//
//  GFButton.swift
//  GHFollowers
//
//  Created by Matias Martinelli on 29/02/2024.
//

import UIKit

class GFButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        // Custom code
        configure()
        
    }
    
    // this init its required for the storyboard
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //Set the background color and title of the button at the init
    init(backgroundColor: UIColor, title: String) {
        super.init(frame: .zero)
        self.backgroundColor = backgroundColor
        self.setTitle(title, for: .normal)
        configure()
    }
    
    //configure the custom button
    private func configure() {
        layer.cornerRadius = 10
        titleLabel?.textColor = .white
        titleLabel?.font = UIFont.preferredFont(forTextStyle: .headline)
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
         super.touchesBegan(touches, with: event)
         animateOpacityChange()
     }

     override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
         super.touchesEnded(touches, with: event)
         animateOpacityChange()
     }

     private func animateOpacityChange() {
         UIView.animate(withDuration: 0.1, animations: {
             self.alpha = self.isHighlighted ? 0.8 : 1.0
         })
     }
 }
