//
//  ProfileViewController.swift
//  ControllersInSwift
//
//  Created by Robert Barney on 10/16/20.
//  Copyright © 2020 App Dog Inc. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    
    private let logicController = ProfileLogicController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        render(.loading)
        
        logicController.load { [weak self] state in
            self?.render(state)
        }
    }
    
}

private extension ProfileViewController {
    
    func render(_ state: ProfileState) {
        switch state {
        case .loading: break
        // Show a loading spinner, for example using a child view controller
        case .presenting(let user): break
        // Bind the user model to the view controller's views
        case .failed: break
            // Show an error view, for example using a child view controller
        }
    }
}
