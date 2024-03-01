//
//  SearchVC.swift
//  GHFollowers
//
//  Created by Matias Martinelli on 29/02/2024.
//

import UIKit

class SearchVC: UIViewController {
    
    let logoImageView = UIImageView()
    let usernameTextField = GFTextField()
    let callToActionButton = GFButton(backgroundColor: .systemGreen, title: "Get Followers")
    
    var isUsernameEntered: Bool { return !usernameTextField.text!.isEmpty }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configureLogoImageView()
        configureTextField()
        configureCallToActionButton()
        createDismissKeyboardTapGesture()
        }
    
    
    // Hide the navigation bar before the view even appear
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden =  true
    }
    
    
    func createDismissKeyboardTapGesture() {
        let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tap)
    }
    
    @objc func pushFollowersListVC() {
        
        guard isUsernameEntered else {
            print("no username")
            return
            }
        
        // Steps to pass data to another VC
        // 1. Create the object
        let followersListVC = FollowerListVC()
        // 2. Configure the data
        followersListVC.username = usernameTextField.text
        followersListVC.title = usernameTextField.text

        
        let transition = CATransition()
        transition.duration = 0.5
        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        transition.type = CATransitionType.push
        transition.subtype = CATransitionSubtype.fromTop
        navigationController?.view.layer.add(transition, forKey: kCATransition)
        self.navigationController?.pushViewController(followersListVC, animated: true)
    }
    
    
    func configureLogoImageView() {
        //first add the Subview
        view.addSubview(logoImageView)
        // set the autoresizing to false that means that I'm are goint to use autoLayout
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        logoImageView.image = UIImage(resource: .ghLogo)
        
        //Set all the contraints
        NSLayoutConstraint.activate([
            logoImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 80),
            logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoImageView.heightAnchor.constraint(equalToConstant: 200),
            logoImageView.widthAnchor.constraint(equalToConstant: 200)
        ])
    }

    
    func configureTextField() {
        view.addSubview(usernameTextField)
        usernameTextField.delegate = self
        
        NSLayoutConstraint.activate([
            usernameTextField.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 48),
            usernameTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            usernameTextField.heightAnchor.constraint(equalToConstant: 50),
            usernameTextField.widthAnchor.constraint(equalToConstant: 290)
        ])
    }
    
    
    func configureCallToActionButton() {
        view.addSubview(callToActionButton)
        //Whenever the user tap the go "Go to Followers" button call pusshFollowesListVC
        callToActionButton.addTarget(self, action: #selector(pushFollowersListVC), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            callToActionButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50),
            callToActionButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            callToActionButton.widthAnchor.constraint(equalToConstant: 290),
            callToActionButton.heightAnchor.constraint(equalToConstant: 50)
        ])
        
    }
}

extension SearchVC: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        pushFollowersListVC()
        return true
    }
}
