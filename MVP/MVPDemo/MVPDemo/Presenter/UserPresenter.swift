//
//  UserPresenter.swift
//  MVPDemo
//
//  Created by Robert Barney on 11/23/20.
//  Copyright © 2020 App Dog Inc. All rights reserved.
//

import Foundation

protocol UserView: NSObjectProtocol {
    func startLoading() 
    func finishLoading()
    func setUsers(users: [UserViewData])
    func setEmptyUsers()
}


// Note that converting User to UserViewData is a responsibility of the presenter.
// Also note that userView must be weak to avoid retain cycle

class UserPresenter {
    
    private let userService:UserService
    weak private var userView : UserView?
    
    init(userService: UserService){
        self.userService = userService
    }
    
    func attachView(view: UserView){
        userView = view
    }
    
    func detachView() {
        userView = nil
    }
    
    func getUsers(){
        self.userView?.startLoading()
        userService.getUsers{ [weak self] users in
            self?.userView?.finishLoading()
            if(users.count == 0){
                self?.userView?.setEmptyUsers()
            }else{
                let mappedUsers = users.map{
                    return UserViewData(name: "\($0.firstName) \($0.lastName)", age: "\($0.age) years")
                }
                self?.userView?.setUsers(users: mappedUsers)
            }
            
        }
    }
}
