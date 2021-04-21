//
//  UserService.swift
//  MVPDemo
//
//  Created by Robert Barney on 11/23/20.
//  Copyright © 2020 App Dog Inc. All rights reserved.
//

import Foundation

class UserService {
 
    //the service delivers mocked data
    func getUsers(callBack:([User]) -> Void){
        let users = [User(firstName: "Iyad", lastName: "Agha", email: "iyad@test.com", age: 36),
                     User(firstName: "Mila", lastName: "Haward", email: "mila@test.com", age: 24),
                     User(firstName: "Mark", lastName: "Astun", email: "mark@test.com", age: 39)
                    ]
        callBack(users)
    }
}
