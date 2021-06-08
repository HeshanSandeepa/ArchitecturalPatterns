//
//  UserViewModel.swift
//  MVVM
//
//  Created by Robert Barney on 2021-05-04.
//  Copyright © 2021 Eric Cerney. All rights reserved.
//

import Foundation

enum UserValidationState {
    case Valid
    case Invalid(String)
}

class UserViewModel {
    
    private let minUsernameLength = 4
    private let minPasswordLength = 5
    private let codeRefreshTime = 5.0
    
    private var user = User() {
        didSet {
            userName.value = user.username
        }
    }
    
    var userName: Box<String> = Box("")
    
    var password: String {
        return user.password
    }
    
    var protectedUserName: String {
        return user.username
    }
    
    var accessCode: Box<String?> = Box(nil)
    
    init(user: User = User()) {
        self.user = user
        startAccessCodeTimer()
    }
    
}

extension UserViewModel {
    func updateUserName(userName: String) {
        user.username = userName
    }
    
    func updatePassword(password: String) {
        user.password = password
    }
    
    func validate() -> UserValidationState {
        if userName.value.isEmpty || password.isEmpty {
            return .Invalid("Username and password are required.")
        }
        
        return .Valid
    }
    
    func login(completion: (_ errorString: String?) -> Void) {
        LoginService.loginWithUsername(username: userName.value,
                                       password: password) {  success in
            if success {
                completion(nil)
            } else {
                completion("Invalid credentials.")
            }
        }
    }
}


private extension UserViewModel {
    
    func startAccessCodeTimer() {
        accessCode.value = LoginService.generateAccessCode()
        dispatchAfter(codeRefreshTime)  { [weak self] in
            self?.startAccessCodeTimer()
        }
        
    }
    
}
