//
//  LoadingViewController.swift
//  ControllersInSwift
//
//  Created by Robert Barney on 9/25/20.
//  Copyright © 2020 App Dog Inc. All rights reserved.
//

import UIKit

// child view controller

class LoadingViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.red
        load()
    }
    
    func load() {
        let spinner = UIActivityIndicatorView(style: .large)
        spinner.translatesAutoresizingMaskIntoConstraints = false
        spinner.startAnimating()
        view.addSubview(spinner)
        
        NSLayoutConstraint.activate([
            spinner.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            spinner.centerXAnchor.constraint(equalTo: view.centerXAnchor)])
    }
    
}
