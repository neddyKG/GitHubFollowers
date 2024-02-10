//
//  UITableView+Ext.swift
//  GithubFollowers
//
//  Created by Neddy Ksenia Gonzalez Siles on 10/2/24.
//

import UIKit

extension  UITableView {
    func removeExcessCells() {
        tableFooterView = UIView(frame: .zero)
    }
}
