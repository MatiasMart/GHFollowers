//
//  FollowerListVC.swift
//  GHFollowers
//
//  Created by Matias Martinelli on 01/03/2024.
//

import UIKit

class FollowerListVC: UIViewController {
    
    var username: String!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBrown
        navigationController?.navigationBar.prefersLargeTitles = true
        }
    

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }

}
