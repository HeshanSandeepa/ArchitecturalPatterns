//
//  Box.swift
//  MVVM
//
//  Created by Robert Barney on 2021-06-08.
//  Copyright © 2021 Eric Cerney. All rights reserved.
//

import Foundation

class Box<T> {
    typealias Listener = (T) -> Void
    var listener: Listener?
    
    var value: T {
        didSet {
            listener?(value)
        }
    }
    
    init(_ value: T) {
        self.value = value
    }
    
    func bind(listerner: Listener?) {
        self.listener = listerner
        listener?(value)
    }
    
}
