//
//  ViewController.swift
//  MVPDemo
//
//  Created by Robert Barney on 11/23/20.
//  Copyright © 2020 App Dog Inc. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    
    private let userPresenter = UserPresenter(userService: UserService())
    private var usersToDisplay = [UserViewData]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        userPresenter.attachView(view: self)
        userPresenter.getUsers()
    }


}

extension ViewController: UserView {
 
    func startLoading() {
        //activityIndicator?.startAnimating()
    }
 
    func finishLoading() {
        //activityIndicator?.stopAnimating()
    }
 
    func setUsers(users: [UserViewData]) {
        usersToDisplay = users
        let userViewData = usersToDisplay[0]
        label.text = userViewData.name
        //tableView?.hidden = false
        //emptyView?.hidden = true;
        //tableView?.reloadData()
    }
 
    func setEmptyUsers() {
        //tableView?.hidden = true
        //emptyView?.hidden = false;
    }
}

