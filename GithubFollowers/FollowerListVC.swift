//
//  FollowerListVC.swift
//  GithubFollowers
//
//  Created by Neddy Ksenia Gonzalez Siles on 10/1/24.
//

import UIKit

class FollowerListVC: UIViewController {

    var username: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        navigationController?.isNavigationBarHidden = false
        navigationController?.navigationBar.prefersLargeTitles = true
    }
 
}
