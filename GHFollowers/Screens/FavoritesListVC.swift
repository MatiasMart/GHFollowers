//
//  FavouristListVC.swift
//  GHFollowers
//
//  Created by Matias Martinelli on 29/02/2024.
//

import UIKit

class FavoritesListVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBlue
            
        PersistenceManager.retrieveFavorites { result in
            switch result {
            case .success(let success):
                print(success)
            case .failure(let failure):
                break
            }
        }
        }


}
