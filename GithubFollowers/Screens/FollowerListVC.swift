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
        
        getUsersFollowers()
    }
    
    func getUsersFollowers() {
        NetworkManager.shared.getFollowers(for: username, page: 1) { followers, errorMessage in
            guard let followers = followers else {
                self.presentGFAlertOnMainThread(title: "Bad stuff", message: errorMessage!, buttonTitle: "Ok")
                return
            }
            
            print("follower count: \(followers.count)")
            print(followers)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
 
}
