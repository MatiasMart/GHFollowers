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
    let testButton = MMButton(background: .systemRed, title: "Test Button")
    
    var isUsernameEntered: Bool { return !usernameTextField.text!.isEmpty }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configureLogoImageView()
        configureTextField()
        configureCallToActionButton()
        configureTestButton()
        createDismissKeyboardTapGesture()
        }
    
    
    // Hide the navigation bar before the view even appear
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
        usernameTextField.text = ""
    }
    
    
    func createDismissKeyboardTapGesture() {
        let tap = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tap)
    }
    
    @objc func pushFollowersListVC() {
        
        guard isUsernameEntered else {
            presentGFAlertOnMainThread(title: "Empty Username", message: "Please enter a username. We need to know who to look for 😀", buttonTitle: "Ok")
            return
            }
        
        // Steps to pass data to another VC
        // 1. Create the object
        let followersListVC = FollowerListVC(username: usernameTextField.text!)

        self.navigationController?.pushViewController(followersListVC, animated: true)
    }
    
    @objc func testMMButton() {
        
        guard isUsernameEntered else { showAlertMessage(title: "Empty Username", message: "Please enter a username. We need to know who to look for 😀")
            return
        }
        
        let excelVC = FollowerListVC(username: usernameTextField.text!)
        excelVC.username = usernameTextField.text
        excelVC.title = usernameTextField.text
        navigationController?.pushViewController(excelVC, animated: true)
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
        //Whenever the user tap the go "Go to Followers" button call pushFollowersListVC
        callToActionButton.addTarget(self, action: #selector(pushFollowersListVC), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
//            callToActionButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50),
            callToActionButton.topAnchor.constraint(equalTo: usernameTextField.bottomAnchor, constant: 200),
            callToActionButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            callToActionButton.widthAnchor.constraint(equalToConstant: 290),
            callToActionButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    func configureTestButton() {
        view.addSubview(testButton)
        testButton.addTarget(self, action: #selector(testMMButton), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            testButton.topAnchor.constraint(equalTo: callToActionButton.bottomAnchor, constant: 10),
            testButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            testButton.widthAnchor.constraint(equalToConstant: 290),
            testButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
}

extension SearchVC: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        pushFollowersListVC()
        return true
    }
}

extension UIViewController{
    
    public func showAlertMessage(title: String, message: String){
        DispatchQueue.main.async {
            let alertMessagePopUpBox = UIAlertController(title: title, message: message, preferredStyle: .alert)
            let okButton = UIAlertAction(title: "OK", style: .default)
            
            alertMessagePopUpBox.addAction(okButton)
            self.present(alertMessagePopUpBox, animated: true)
        }
    }
}

