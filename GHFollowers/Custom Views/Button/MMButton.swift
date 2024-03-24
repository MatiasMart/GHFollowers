//
//  MMButton.swift
//  GHFollowers
//
//  Created by Matias Martinelli on 22/03/2024.
//

import UIKit

class MMButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        config()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(background: UIColor, title: String) {
        self.init(frame: .zero)
        self.backgroundColor = background
        self.setTitle(title, for: .normal)
    }
    
    private func config() {
        layer.cornerRadius = 10
        titleLabel?.textColor = .label
        titleLabel?.font = UIFont.preferredFont(forTextStyle: .headline)
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        animatedOpacity()
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        animatedOpacity()
    }
    
    func animatedOpacity() {
        UIView.animate(withDuration: 0.1, animations: {
            self.alpha = self.isHighlighted ? 0.8 : 1.0
        })
    }
}
