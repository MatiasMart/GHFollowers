//
//  GFAlertVC.swift
//  GHFollowers
//
//  Created by Matias Martinelli on 01/03/2024.
//

import UIKit

class GFAlertVC: UIViewController {
    
    let containerView = GFAlertContainer()
    let titleLabel = GFTitleLabel(textAlignment: .center, fontSize: 20)
    let messageLabel = GFBodyLabel(textAlignment: .center)
    let acctionButton = GFButton(backgroundColor: .systemPink, title: "Ok")
    
    var alertTitle: String?
    var message: String?
    var buttonTitle: String?
    
    init(alertTitle: String? = nil, message: String? = nil, buttonTitle: String? = nil) {
        super.init(nibName: nil, bundle: nil)
        self.alertTitle = alertTitle
        self.message = message
        self.buttonTitle = buttonTitle
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.75)
    }
    
    
    func configureContainerView() {
        view.addSubview(containerView)
        
        NSLayoutConstraint.activate([
        
        ])
    }
}
