//
//  UITableView+Ext.swift
//  GithubFollowers
//
//  Created by Neddy Ksenia Gonzalez Siles on 10/2/24.
//

import UIKit

extension  UITableView {
    
//    We don't use in this app, but it's useful in gral. for other apps where this repeats.
    func reloadDataOnMainThread() {
        DispatchQueue.main.async {
            self.reloadData()
        }
    }
    
    func removeExcessCells() {
        tableFooterView = UIView(frame: .zero)
    }
}
