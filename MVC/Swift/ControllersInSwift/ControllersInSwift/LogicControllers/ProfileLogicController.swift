//
//  ProfileLogicController.swift
//  ControllersInSwift
//
//  Created by Robert Barney on 10/21/20.
//  Copyright © 2020 App Dog Inc. All rights reserved.
//

import UIKit

enum ProfileState {
    case loading
    case presenting(String)
    case failed
}

class ProfileLogicController {
    
    typealias Handler = (ProfileState) -> Void
    
    func load(then handler: @escaping Handler) {
        // Load the state of the view and then run a completion handler
    }
    
    func changeDisplayName(to name: String, then handler: @escaping Handler) {
        // Change the user's display name and then run a completion handler
    }
    
    func changeProfilePhoto(to photo: UIImage, then handler: @escaping Handler) {
        // Change the user's profile photo and then run a completion handler
    }
    
    func logout() {
        // Log the user out, then re-direct to the login screen
    }
}
