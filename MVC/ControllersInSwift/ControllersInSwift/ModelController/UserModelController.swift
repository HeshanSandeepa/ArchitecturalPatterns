//
//  UserModelController.swift
//  ControllersInSwift
//
//  Created by Robert Barney on 11/18/20.
//  Copyright © 2020 App Dog Inc. All rights reserved.
//

import Foundation

class UserModelController {
    
    private var user: User

    init(user: User) {
        self.user = user
    }
    
    func update() {
        // some action & completion handler
    }
}

extension UserModelController {

    var displayName: String {
        return "\(user.firstName) \(user.lastName)"
    }
}
