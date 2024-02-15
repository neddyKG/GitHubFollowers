//
//  FavoritesListVC.swift
//  GithubFollowers
//
//  Created by Neddy Ksenia Gonzalez Siles on 9/1/24.
//

import UIKit

class FavoritesListVC: GFDataLoadingVC {
    
    let tableView = UITableView()
    var favorites: [Follower] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewController()
        configureTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getFavorites()
    }
    
    func configureViewController() {
        view.backgroundColor = .systemBackground
        title = "Favorites"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    func configureTableView() {
        view.addSubview(tableView)
        tableView.frame = view.bounds
        tableView.rowHeight = 80
        tableView.delegate = self
        tableView.dataSource = self
        tableView.removeExcessCells()
        
        tableView.register(FavoriteCell.self, forCellReuseIdentifier: FavoriteCell.reuseID)
    }
    
    func getFavorites() {
        PersistenceManager.retrieveFavorites { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let favorites):
                self.updateUI(with: favorites)
                
            case .failure(let error):
                self.presentGFAlertOnMainThread(title: "Somthing went wrong", message: error.rawValue, buttonTitle: "Ok")
                break
            }
        }
    }
    
    func updateUI(with favorites: [Follower]) {
        self.showEmptyStateViewOnFavoritesEmpty()
        if favorites.isEmpty { return }
        
        self.favorites = favorites
        DispatchQueue.main.async {
            print("fave: ", self.favorites)
            self.tableView.reloadData()
            self.view.bringSubviewToFront(self.tableView)
            return
        }
    }
    
    func showEmptyStateViewOnFavoritesEmpty() {
        if favorites.isEmpty {
            self.showEmptyStateView(with: "No favorites yet!\nAdd one on the follower screen.", in: self.view)
        }
    }
}

// Instructor personal preference: If the data is complex move the DataSource out of the VC, if not keep it simple (in the VC).
extension FavoritesListVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favorites.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: FavoriteCell.reuseID) as! FavoriteCell
        let favorite = favorites[indexPath.row]
        cell.set(favorite: favorite)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let favorite = favorites[indexPath.row]
        let followerListVC = FollowerListVC(username: favorite.login)
        
        navigationController?.pushViewController(followerListVC, animated: true)
    }
    
    // write "commit" and editingStyle will appear
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        guard editingStyle == .delete else { return }
        
        PersistenceManager.updateWith(favorite: favorites[indexPath.row], actionType: .remove) { [weak self] error in
            guard let self = self else { return }
            guard let error = error else {
                favorites.remove(at: indexPath.row)
                tableView.deleteRows(at: [indexPath], with: .left)
                
                DispatchQueue.main.async {
                    self.showEmptyStateViewOnFavoritesEmpty()
                }
                return
            }
            self.presentGFAlertOnMainThread(title: "Unable to remove", message: error.rawValue, buttonTitle: "Ok")
        }
    }
    
}
