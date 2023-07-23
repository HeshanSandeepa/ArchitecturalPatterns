//
//  ViewController.swift
//  ControllersInSwift
//
//  Created by Robert Barney on 9/25/20.
//  Copyright © 2020 App Dog Inc. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let loader = LoadingViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
         view.backgroundColor = UIColor.gray
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        addLoader()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 10.0, execute: {
            self.removeLoader()
        })
    }
}

extension ViewController {
    func addLoader() {
        view.addSubview(loader.view)
        addChild(loader)
        loader.didMove(toParent: self)
    }
    
    func removeLoader() {
        loader.willMove(toParent: nil)
        loader.removeFromParent()
        loader.view.removeFromSuperview()
    }
}



